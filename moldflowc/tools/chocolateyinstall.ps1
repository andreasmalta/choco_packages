$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#1 DOWNLOAD & EXTRACT
$url = 'https://download.autodesk.com/global/moldflow_communicator/mfc_2027_fcs_multilingual_win_64bit_db_002_002.7z'
$checksum = '35681119E8823B46720A01D8FF7C3D87E5FE8EAC9CDBED5D2051A8769CD3C0DB'
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
