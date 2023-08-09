$ErrorActionPreference = 'Stop';
$url = 'https://brightsignbiz.s3.amazonaws.com/brightauthor/5.0/5.0.1.5/BrightAuthorSetup-5.0.1.5.exe'
$checksum = '2F6FA35EB377AAB4D535924A26BB7E66CC7DA47C3EB3E75769509F0985E6008B'

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
