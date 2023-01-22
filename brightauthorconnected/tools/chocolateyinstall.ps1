$ErrorActionPreference = 'Stop';
$url = 'https://www.brightsignnetwork.com/download/ba-connected-builds/ba-connected-prod/BA%20connected%20Setup%201.7.17.exe'
$checksum = 'DDF11ADB9CC286CF38C11CA0CD21021AA7D782B87D0D1120E55E56D7A9A5D822'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = $url
  softwareName  = 'BAconnected*'
  checksum      = $checksum
  checksumType  = 'sha256'
  silentArgs    = "/S"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
