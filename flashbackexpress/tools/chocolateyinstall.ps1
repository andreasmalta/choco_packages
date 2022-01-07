$ErrorActionPreference = 'Stop';
$url            = 'https://files.bbsoftware.co.uk/bbfbex5.exe'
$checksum       = '249F32418A4324CA101004546AEAAD0A785C9DEBCF9984863D8E0D38B7FDDD19'

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
