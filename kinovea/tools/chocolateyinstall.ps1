$ErrorActionPreference = 'Stop';
$url            = 'https://www.kinovea.org/setup/kinovea.0.9.4/Kinovea-0.9.4-x64.exe'
$checksum       = '02A38BC3E0C72542647AAE783460F5C2183E06BED7570650DE240FF72E11B5F4'

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
