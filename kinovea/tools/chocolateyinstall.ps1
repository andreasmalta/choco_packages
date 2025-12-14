$ErrorActionPreference = 'Stop';
$url = 'https://www.kinovea.org/setup/kinovea.2025.1/2025.1.1/Kinovea-2025.1.1.exe'
$checksum = '4452CCA3DE78634D749673F302015C7CDE8212F0B32FF5AD312E41217096D581'

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
