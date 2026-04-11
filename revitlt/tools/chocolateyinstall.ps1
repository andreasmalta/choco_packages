$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#1 DOWNLOAD & EXTRACT
$url = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2027/RVTLT/94BF3D5E-F8D4-30BB-B5D7-B1C6FCD04204/SFX/RVTLT_2027_NA_win_db_002_002.7z'
$checksum = '613928A872C12D742A46CAEB27AE4CB9F5188D23BDFC7D992699792C15456259'
$tempversion = Join-Path $env:TEMP (Join-Path $env:ChocolateyPackageName $env:ChocolateyPackageVersion)
$packageArgsUnzip = @{
  packageName    = 'Revit LT Installation Files'
  url            = $url
  checksum       = $checksum
  checksumType   = 'sha256'
  unziplocation  = $tempversion
}
Install-ChocolateyZipPackage @packageArgsUnzip

#2 UNINSTALL OLD
. $toolsDir\helpers.ps1
Invoke-UninstallOld

#3 INSTALL
$setup = Join-Path $tempversion 'setup.exe'
$packageArgs  = @{
  packageName    = 'Revit LT'
  fileType       = 'exe'
  file           = $setup
  softwareName   = 'Revit LT*'
  silentArgs     = '-q'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgs

#4 WAIT UNTIL INSTALLED
Write-Host "Waiting for Autodesk Installer to finish..."
Start-Sleep 120
while ($true) {
    # (re)try
    $processCHK = Get-Process | Where {$_.ProcessName -Like 'Installer'}
    if ($processCHK -eq $null)
    {
        Write-Host "Autodesk Installer ready!"
		# exit the loop
        break;
    }
    # wait
    Write-Host "Waiting for Autodesk Installer to finish, trying again in 30 seconds..."
    Start-Sleep 30
}
