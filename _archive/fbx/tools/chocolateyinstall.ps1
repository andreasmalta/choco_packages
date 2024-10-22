$ErrorActionPreference = 'Stop';
$url = 'https://files.bbsoftware.co.uk/bbfbx.exe'
$checksum = 'D331F6739C6A54ED48E1E1638E838B5BF45BCF01C5127CB68504F13F7741F48C'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = $url
  softwareName  = 'fbx*'
  checksum      = $checksum
  checksumType  = 'sha256'
  silentArgs    = "/S"
  validExitCodes= @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgs
