$ErrorActionPreference = 'Stop';

$url = "https://www.brightsignnetwork.com/download/ba-connected-builds/ba-connected-prod/BA%20connected%20Setup%20" + $Env:ChocolateyPackageVersion + ".exe"
$checksum = 'A1245BC1B428DC2AD760AC87A8605C85CC053E0B4345B27F85B7C69036674B24'

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
