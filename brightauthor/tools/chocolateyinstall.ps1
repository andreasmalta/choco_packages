$ErrorActionPreference = 'Stop';

$url = "https://brightsignbiz.s3.amazonaws.com/brightauthor/5.0/" + $Env:ChocolateyPackageVersion + "/BrightAuthorSetup-" + $Env:ChocolateyPackageVersion + ".exe"
$checksum = '9C34FDF07E7001408F4515C68C82DB5F2107203C91CB33E87B29637C4BB494FB'

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
