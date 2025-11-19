$ErrorActionPreference = 'Stop';

$url = 'https://downloads.bsn.cloud/BA%20connected%20Setup%201.71.1.exe'
$checksum = 'CD78182F9E87A7925325F3492A26019155010AC53AAB25A0893A01A5B9F88642'

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
