$ErrorActionPreference = 'Stop';

$url            = 'https://up.autodesk.com/2017/CDX/AB4AADCC-F890-4B4F-A7A6-B0FBD2386796/DesktopConnector-x64.exe'
$checksum       = '4E06EE85D4612270C8F5E1D275C836F16CAC794D49305B4B4E26FA0F93D8D78F'
$unzip           = Join-Path $env:TEMP 'Autodesk_Desktop_Connector_14_10_0_1456_Win_64bit'

$packageArgsUnzip = @{
  packageName    = 'Unzip'
  fileType       = 'exe'
  url            = $url
  softwareName   = 'Unzip*'
  checksum       = $checksum
  checksumType   = 'sha256'
  silentArgs     = "-suppresslaunch -d $env:TEMP"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgsUnzip

$adsso           = Join-Path $unzip 'x64\AdSSO\AdSSO.msi'
$packageArgsAdSSO  = @{
  packageName    = 'Autodesk Single Sign On Component'
  fileType       = 'msi'
  file           = $adsso
  softwareName   = 'Autodesk Single Sign On Component*'
  silentArgs     = "/qn /norestart"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgsAdSSO

$cdx             = Join-Path $unzip 'x64\CDX\CDX.msi'
$packageArgsCDX  = @{
  packageName    = 'Autodesk Desktop Connector'
  fileType       = 'msi'
  file           = $cdx
  softwareName   = 'Autodesk Desktop Connector*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgsCDX

#Close software running in elevated mode
Stop-Process -Name "DesktopConnector*" -Force
