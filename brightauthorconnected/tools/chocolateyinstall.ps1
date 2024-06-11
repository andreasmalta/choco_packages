$ErrorActionPreference = 'Stop';

$url = "https://ba-connected.s3.amazonaws.com/BA+connected+Setup+" + $Env:ChocolateyPackageVersion + ".exe"
$checksum = '57A2C3E3BA27FB5453ED6B341B7D2797379D376B30BD7D2AE80CFDDA775F8B3E'

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
