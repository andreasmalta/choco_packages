$ErrorActionPreference = 'Stop';
$url = 'https://downloads.dell.com/serviceability/catalog/SupportAssistInstaller.exe'
$checksum = '128161E2E24AA7C42528C8D9A32F67BD466276B2CC8E970F17F6C82FB88C5D1F'

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
