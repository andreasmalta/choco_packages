$ErrorActionPreference = 'Stop';

$url = "https://www.brightsignnetwork.com/download/ba-connected-builds/ba-connected-prod/BA%20connected%20Setup%20" + $Env:ChocolateyPackageVersion + ".exe"
$checksum = '58227EDFCB5640DA35189B4D4A646533276C4F22A791F117026308C818252F54'

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
