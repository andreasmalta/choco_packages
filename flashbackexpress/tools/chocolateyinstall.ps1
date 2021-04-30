$ErrorActionPreference = 'Stop';
$url            = 'https://files.bbsoftware.co.uk/bbfbex5.exe'
$checksum       = 'DBE40C5E78F45DD80A26D36D3F9DAA9B7669DA14E3B5F223CC949029FFFD45B6'

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
