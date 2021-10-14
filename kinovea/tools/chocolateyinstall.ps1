$ErrorActionPreference = 'Stop';
$url            = 'https://www.kinovea.org/setup/kinovea.0.9.5/Kinovea-0.9.5-x64.exe'
$checksum       = '489FBCC5006B97830511490B251772BBCC7D23689CB8A635B8BF75590C2B7656'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'kinovea*'
  fileType      = 'exe'
  url           = $url
  checksum      = $checksum
  checksumType  = 'sha256'
  silentArgs    = "/S"
  validExitCodes= @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgs
