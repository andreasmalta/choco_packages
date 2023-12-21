$ErrorActionPreference = 'Stop';

$url = "https://brightsignbiz.s3.amazonaws.com/brightauthor/5.0/" + $Env:ChocolateyPackageVersion + "/BrightAuthorSetup-" + $Env:ChocolateyPackageVersion + ".exe"
$checksum = '8469AB20CFFF965F8D115C5B2C462954D92DD0BAD5C793FD8ABF688E28425055'

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
