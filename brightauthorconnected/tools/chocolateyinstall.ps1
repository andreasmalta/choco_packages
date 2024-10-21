$ErrorActionPreference = 'Stop';

$url = "https://downloads.bsn.cloud/BA%20connected%20Setup%20" + $Env:ChocolateyPackageVersion + ".exe"
$checksum = '8E7429339EF6EA517328BD33F9F4F0EDA3548F952EDB33FC1B6A8F129FF2410D'

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
