$ErrorActionPreference = 'Stop';

$url = "https://ba-connected.s3.amazonaws.com/BA+connected+Setup+" + $Env:ChocolateyPackageVersion + ".exe"
$checksum = '71891FD8E6A3AAFC7DE8C0B0AB388F0E1945C7921D5A57AC6790F4ECDEE79D07'

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
