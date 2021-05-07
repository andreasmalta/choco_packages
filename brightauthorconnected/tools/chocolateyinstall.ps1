$ErrorActionPreference = 'Stop';
$url            = 'https://brightsignnetwork.com/download/nsingh/ba-connected/BA-connected-Setup-1.6.36.exe'
$checksum_url   = '07A379EE32D45AD2D485F408B236CB006527C0CB638ECD926EBD0EE210E317F8'

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
