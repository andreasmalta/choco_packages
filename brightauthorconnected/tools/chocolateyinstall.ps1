$ErrorActionPreference = 'Stop';
$url            = 'https://brightsignnetwork.com/download/nsingh/ba-connected/BA%20connected%20Setup%201.6.40.exe'
$checksum_url   = '2A6F9B047C86368C086DD6B4D8D52ACE1B70DCC6B74ED744C43724DA92213850'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $env:TEMP
  fileType      = 'exe'
  url           = $url
  softwareName  = 'BAconnected*'
  checksum      = $checksum_url
  checksumType  = 'sha256'
  silentArgs    = "/S"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
