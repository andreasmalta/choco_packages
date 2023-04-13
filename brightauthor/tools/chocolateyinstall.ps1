$ErrorActionPreference = 'Stop';
$url = 'https://brightsignbiz.s3.amazonaws.com/brightauthor/5.0/5.0.1.2/BrightAuthorSetup-5.0.1.2.exe'
$checksum = 'DD425F33930DF791858A415D70ADD411F7E78421D82F8123261316E413012E39'

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
