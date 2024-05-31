$ErrorActionPreference = 'Stop';

$url = "https://brightsignbiz.s3.amazonaws.com/brightauthor/5.0/" + $Env:ChocolateyPackageVersion + "/BrightAuthorSetup-" + $Env:ChocolateyPackageVersion + ".exe"
$checksum = '00E06B53C2C53D105F9B5C0472F5E31DE1493A5C007927B6D759B9274E3D7E91'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = $url
  softwareName  = 'BrightAuthor*'
  checksum      = $checksum
  checksumType  = 'sha256'
  silentArgs    = "/S"
  validExitCodes= @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgs
