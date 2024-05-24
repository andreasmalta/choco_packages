$ErrorActionPreference = 'Stop';
$url = 'https://www.kinovea.org/setup/kinovea.2023.1/2023.1.1/Kinovea-2023.1.1.exe'
$checksum = 'C56C384F0EA0E7F7E699BFEEDE650911C721BA7A567F83C04B609D1D95766FE5'

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
