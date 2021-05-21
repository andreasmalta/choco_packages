$ErrorActionPreference = 'Stop';
$url            = 'https://files.bbsoftware.co.uk/bbfbex5.exe'
$checksum       = '0E869238508BEF4DD7900D2236A3D6AA11FEAD8359B6C4D995424F3DD613165B'

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
