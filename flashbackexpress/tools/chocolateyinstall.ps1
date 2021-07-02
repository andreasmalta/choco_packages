$ErrorActionPreference = 'Stop';
$url            = 'https://files.bbsoftware.co.uk/bbfbex5.exe'
$checksum       = '6BA171208B66E5D1D3D27121478465E0B63EAE6ACCC573F44D970E27DF75A485'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = $url
  softwareName  = 'flashbackexpress*'
  checksum      = $checksum
  checksumType  = 'sha256'
  silentArgs    = "/S"
  validExitCodes= @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgs
