$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#1 DOWNLOAD & EXTRACT
$url = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2027/ACDLT/16D82284-5250-31A0-8CC0-08AD80F42024/SFX/ACDLT_2027_english_us_win_db_002_002.7z'
$checksum = '0F9AA52C18C17A4F81188734DA47F9ED75836FC1673FB4B00FF684DDCD013458'
$tempversion = Join-Path $env:TEMP (Join-Path $env:ChocolateyPackageName $env:ChocolateyPackageVersion)
$packageArgsUnzip = @{
  packageName    = 'ACDLT Installation Files'
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
  packageName    = 'AutoCAD LT'
  fileType       = 'exe'
  file           = $setup
  softwareName   = 'AutoCAD LT*'
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
