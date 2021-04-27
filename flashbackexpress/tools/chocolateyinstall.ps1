$ErrorActionPreference = 'Stop';
$url            = 'https://files.bbsoftware.co.uk/bbflbk5.exe'
$checksum       = '3856B26D191A3F7160825C0198B72047689869F212BC0652BD544827EFFDA8C9'

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
