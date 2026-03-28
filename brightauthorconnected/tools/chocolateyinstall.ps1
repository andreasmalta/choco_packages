$ErrorActionPreference = 'Stop';

$url = 'https://downloads.bsn.cloud/BA%20connected%20Setup%201.78.0.exe'
$checksum = 'DC7FB1C49C0AF4375042CEC4784B1F202C4C369150DAB309BC2D57382E8CA1D5'

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
