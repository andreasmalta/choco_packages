$ErrorActionPreference = 'Stop';

$url            = 'https://up.autodesk.com/2017/CDX/AB4AADCC-F890-4B4F-A7A6-B0FBD2386796/DesktopConnector-x64.exe'
$checksum       = 'BD36E711A8270EBFAACD85EB5A30D65C5373B0AAA7D768DA1D39F18E63514028'
$unzip           = Join-Path $env:TEMP 'Autodesk_Desktop_Connector_15_6_0_1752_Win_64bit'

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
