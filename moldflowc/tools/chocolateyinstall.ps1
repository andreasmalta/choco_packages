$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#ADJUST FOR LATEST VERSION
$url = 'https://download.autodesk.com/us/moldflow/2024/autodesk_moldflow_communicator_2024_en-us_windows_002_002.7z'
$checksum = '99320CEF9E397C621D01D7893DF11FB70E6CB76247B2B17CA5787FC710820382'
$temppackage = Join-Path $env:TEMP $env:ChocolateyPackageName
$install = Join-Path $temppackage $env:ChocolateyPackageVersion
$file = Join-Path $install 'setup.exe'

#REMOVE OLD VERSIONS
. $toolsDir\helpers.ps1
Invoke-UninstallOldMFC

#EXTRACT & INSTALL
$packageArgsUnzip = @{
  packageName    = 'MFC Installation Files'
  url            = $url
  checksum       = $checksum
  checksumType   = 'sha256'
  unziplocation  = $install
}
Install-ChocolateyZipPackage @packageArgsUnzip

$packageArgs  = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  file           = $file
  silentArgs     = '-q'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgs
