$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#1 DOWNLOAD & EXTRACT
$url = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2027/INVPROSA/447AF3F0-5A11-3D54-B8C1-9D1C88C26148/SFX/Inventor_Professional_2027_English_Win_64bit_db_002_002.7z'
$checksum = '87A0196BD51EEB046695F7D2EEE477DB162378C5D03060403709F53D05DB33FD'
$tempversion = Join-Path $env:TEMP (Join-Path $env:ChocolateyPackageName $env:ChocolateyPackageVersion)
$packageArgsUnzip = @{
  packageName    = 'Inventor Installation Files'
  url            = $url
  checksum       = $checksum
  checksumType   = 'sha256'
  unziplocation  = $tempversion
}
Install-ChocolateyZipPackage @packageArgsUnzip

#2 UNINSTALL OLD
. $toolsDir\helpers.ps1
Invoke-UninstallInventor

#3 INSTALL
$setup = Join-Path $tempversion 'setup.exe'
$packageArgs  = @{
  packageName    = 'Inventor'
  fileType       = 'exe'
  file           = $setup
  softwareName   = 'Inventor*'
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
