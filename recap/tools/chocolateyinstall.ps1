$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#1 DOWNLOAD & EXTRACT
$url = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2027/RECAP/6F33CCE3-6888-3D07-97B1-53A51CA5A13D/SFX/RECAP_2027_ML_db_002_002.7z'
$checksum = 'F3179327AFB9C4C40FA26CD3A9C294D824F4DCD663F31378BA7F2E60C74552B5'
$tempversion = Join-Path $env:TEMP (Join-Path $env:ChocolateyPackageName $env:ChocolateyPackageVersion)
$packageArgsUnzip = @{
  packageName    = 'Installation Files'
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
  packageName    = 'Civil 3D'
  fileType       = 'exe'
  file           = $setup
  softwareName   = 'Civil 3D*'
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
