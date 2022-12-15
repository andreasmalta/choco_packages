$ErrorActionPreference = 'Stop';
$url = 'https://brightsignbiz.s3.amazonaws.com/brightauthor/5.0/5.0.0.3/BrightAuthorSetup-5.0.0.3.exe'
$checksum = '740B047F9AC275D496891951858EC3DA03481876870385F1FAA19E2F9798AD24'

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
