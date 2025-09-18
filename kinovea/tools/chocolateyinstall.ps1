$ErrorActionPreference = 'Stop';
$url = 'https://www.kinovea.org/setup/kinovea.2024.1/2024.1.1/Kinovea-2024.1.1.exe'
$checksum = 'AEE87CEEED0A54643E7851C308907D97583AF359E9624B06B8CAB75BFEB51E3D'

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
