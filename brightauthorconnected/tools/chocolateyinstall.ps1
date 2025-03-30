$ErrorActionPreference = 'Stop';

$url = "https://downloads.bsn.cloud/BA%20connected%20Setup%201.59.0.exe"
$checksum = 'B3549F30EFDB9B95966E082D3F1410F12F1B87F0F4BBDC0394321D45AD5EBCAF'

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
