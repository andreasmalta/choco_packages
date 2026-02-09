$ErrorActionPreference = 'Stop';

$url = 'https://downloads.bsn.cloud/BA%20connected%20Setup%201.76.0.exe'
$checksum = 'FBF89B9F7EFE427DA284655665BC90C32FA633151190ADF5762232CE19FC095D'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = $url
  softwareName  = 'BAconnected*'
  checksum      = $checksum
  checksumType  = 'sha256'
  silentArgs    = '/S'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
