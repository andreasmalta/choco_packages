$ErrorActionPreference = 'Stop';

$url = "https://downloads.bsn.cloud/BA%20connected%20Setup%201.63.2.exe"
$checksum = 'AD0E22BB364E59BCC8E8A20D8CBBC4464ADA24A599B57B62B2CACAFAF08D74C4'

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
