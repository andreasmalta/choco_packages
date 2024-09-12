$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#1 DOWNLOAD & EXTRACT
$url = 'https://download.autodesk.com/global/moldflow_communicator/autodesk_moldflow_communicator_2025_en-us_windows_002_002.7z'
$checksum = '136336AE29AEFC9CFB4031BFC94FC21FF301C6788F722B19557B2E35874EDA18'
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
