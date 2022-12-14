$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url = 'https://up.autodesk.com/2017/CDX/AB4AADCC-F890-4B4F-A7A6-B0FBD2386796/DesktopConnector-x64-16.0.0.1902.exe'
$checksum = '575CDCACC7A99DA0C419D85E0A57F48150AD07C2B71C833A846B8C30F34A7285'
$file = Join-Path $env:TEMP 'Autodesk_Desktop_Connector_16_0_0_1902_Win_64bit\Setup.exe'

. $toolsDir\helpers.ps1
Invoke-UninstallOldAutodesk

$packageArgsUnzip = @{
  packageName    = 'Autodesk Desktop Connector Installation Files'
  fileType       = 'exe'
  url            = $url
  softwareName   = 'Autodesk Desktop Connector Installation Files*'
  checksum       = $checksum
  checksumType   = 'sha256'
  silentArgs     = "-suppresslaunch -d $env:TEMP"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgsUnzip

$packageArgs  = @{
  packageName    = 'Autodesk Desktop Connector'
  fileType       = 'exe'
  file           = $file
  softwareName   = 'Autodesk Desktop Connector*'
  silentArgs     = '-q'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgs

#Close software running in elevated mode
Stop-Process -Name "DesktopConnector*" -Force
