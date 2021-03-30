$ErrorActionPreference = 'Stop';
$url            = 'https://brightsignnetwork.com/download/nsingh/ba-connected/BA-connected-Setup-1.6.31.exe'
$checksum_url   = '65613064C8409C0B3BF54EB15998274C0FCBFFCF0F3D5B4BB95DAE52C0DE188B'

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
