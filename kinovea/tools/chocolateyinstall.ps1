$ErrorActionPreference = 'Stop';
$url = 'https://www.kinovea.org/setup/kinovea.2025.1/2025.1.0/Kinovea-2025.1.0.exe'
$checksum = '71EAEED5F2E4E997EFC4B7A10D988BC2EF4FEAF9418118EA8552CAE05D8D3872'

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
