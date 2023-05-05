$ErrorActionPreference = 'Stop';
$url = 'https://downloads.dell.com/serviceability/catalog/SupportAssistInstaller.exe'
$checksum = '9718940E2B13ADD6E2019B23075F30FB36137568C3F54EE24624D7C86B6ABFC9'

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
