$ErrorActionPreference = 'Stop';
$url = 'https://downloads.dell.com/serviceability/catalog/SupportAssistInstaller.exe'
$checksum = 'C036334A0730C13EE11FD79C6A555162160E79F10B7A82704D4C3553DF458569'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = $url
  softwareName  = 'SupportAssist*'
  checksum      = $checksum
  checksumType  = 'sha256'
  silentArgs    = "/S"
  validExitCodes= @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgs
