$ErrorActionPreference = 'Stop';
$url = 'https://brightsignbiz.s3.amazonaws.com/brightauthor/5.0/5.0.1.4/BrightAuthorSetup-5.0.1.4.exe'
$checksum = 'D96E86990A95BCEBFF48D3E5F7B229A5BEF938C303BB339FFC0EAFF7BFF96541'

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
