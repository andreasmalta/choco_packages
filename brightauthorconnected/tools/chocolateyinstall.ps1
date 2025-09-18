$ErrorActionPreference = 'Stop';

$url = 'https://downloads.bsn.cloud/BA%20connected%20Setup%201.67.0.exe'
$checksum = '2F38ACF4B56F1C0B0EE4CF634768D09D44391348D7ACA64B461156EA6141B7AA'

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
