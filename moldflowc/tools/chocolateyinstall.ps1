$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#1 DOWNLOAD & EXTRACT
$url = 'https://download.autodesk.com/global/moldflow_communicator/mfc_2026_fcs_multilingual_win_64bit_db_002_002.7z'
$checksum = '7F1110EE26B4297CFDD86FF995AC945F7F58108B534F27A2F4E5B83BF73BF41F'
$temppackage = Join-Path $env:TEMP $env:ChocolateyPackageName
$tempversion = Join-Path $temppackage $env:ChocolateyPackageVersion
$packageArgsUnzip = @{
  packageName    = 'MFC Installation Files'
  url            = $url
  checksum       = $checksum
  checksumType   = 'sha256'
  unziplocation  = $tempversion
}
Install-ChocolateyZipPackage @packageArgsUnzip

#2 UNINSTALL OLD
. $toolsDir\helpers.ps1
Invoke-UninstallOldMFC

#3 INSTALL
$setup = Join-Path $tempversion 'setup.exe'
$packageArgs  = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  file           = $setup
  silentArgs     = '-q'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgs
