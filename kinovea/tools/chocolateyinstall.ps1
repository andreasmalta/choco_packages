$ErrorActionPreference = 'Stop';
$url = 'https://www.kinovea.org/setup/kinovea.2023.1/2023.1.2/Kinovea-2023.1.2.exe'
$checksum = '8B0F1C314FC42F680EA94C666802DC81B14967229E4093B2F37011A04720372C'

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
