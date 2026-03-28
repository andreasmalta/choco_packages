$ErrorActionPreference = 'Stop';
$url = 'https://www.kinovea.org/setup/kinovea.2025.2/2025.2.0/Kinovea-2025.2.0.exe'
$checksum = 'E13FE517BCF016C7730DFB3E13976E305114CFF910BC0B015C79DDCA4319FFC2'

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
