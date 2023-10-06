$ErrorActionPreference = 'Stop';

$url = "https://www.brightsignnetwork.com/download/ba-connected-builds/ba-connected-prod/BA%20connected%20Setup%20" + $Env:ChocolateyPackageVersion + ".exe"
$checksum = '10E35D76F5DC2609C9937D734C4448AEA874A1F794165AB42181526A29E01717'

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
