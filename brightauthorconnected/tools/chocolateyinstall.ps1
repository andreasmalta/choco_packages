$ErrorActionPreference = 'Stop';

$url = 'https://downloads.bsn.cloud/BA%20connected%20Setup%201.67.3.exe'
$checksum = '1407500BDCD55E77F980F29658EDB705C48832ECBC8900A5079E2CC5C1DA9EF3'

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
