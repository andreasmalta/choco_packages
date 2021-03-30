$ErrorActionPreference = 'Stop';

$url            = 'https://up.autodesk.com/2017/CDX/AB4AADCC-F890-4B4F-A7A6-B0FBD2386796/DesktopConnector-x64.exe'
$checksum_url   = '1C0272A2F88D8F1F5AF0C7984ED2A6E071DB44EFD99C548133DE7F70396A91EB'
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

#Close software running in elevated mode
Stop-Process -Name "DesktopConnector*" -Force
