$ErrorActionPreference = 'Stop';
$url             = 'https://downloads.dell.com/serviceability/catalog/SupportAssistInstaller.exe'
$checksum        = 'E9778687B5DA6B690313DD3C695A80D2716996DEA3BB0C30D0A3D69763341DD7'

$packageArgs     = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'supportassist*'
  unzipLocation  = $env:TEMP
  fileType       = 'exe'
  url            = $url
  checksum       = $checksum
  checksumType   = 'sha256'
  silentArgs     = "-s -v/qn"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgs
