$ErrorActionPreference = 'Stop';

$url            = 'https://up.autodesk.com/2017/CDX/AB4AADCC-F890-4B4F-A7A6-B0FBD2386796/DesktopConnector-x64.exe'
$checksum_url   = '0E0D82FB24F1758C581BB9EA65A7A4364E560638834161E5B312618C32BD0F7B'
$packageArgsURL = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = $url
  softwareName  = 'autodesk desktop connector*'
  checksum      = $checksum_url
  checksumType  = 'sha256'
  silentArgs    = "/quiet /norestart"
  validExitCodes= @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgsURL
Stop-Process -Name "DesktopConnector*" -Force
