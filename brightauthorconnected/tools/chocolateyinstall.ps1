$ErrorActionPreference = 'Stop';

$url = "https://ba-connected.s3.amazonaws.com/BA+connected+Setup+" + $Env:ChocolateyPackageVersion + ".exe"
$checksum = '1EFAE87D93BFFB2BE36D3EA8EDF904E33CAEBD8E292D16DF8F367B63EF485F69'

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
