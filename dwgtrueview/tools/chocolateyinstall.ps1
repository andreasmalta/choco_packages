$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$downloadsPath = (New-Object -ComObject Shell.Application).Namespace('shell:Downloads').Self.Path

#1 LANGUAGE SELECTION
$pp = Get-PackageParameters
if ($pp.'French') {
$url = 'https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage301407108829295.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_PLC0000037_2025_French_WIN64.exe%22&'
$checksum = 'B69C16C885792279587410CD9A657B3A8FA81D9CCEE94BFF7515611942B4B11F'
$file = Join-Path $downloadsPath 'Autodesk\DWG TrueView 2025 - Français (French) - (FR)\Setup.exe'
}

elseif ($pp.'Japanese') {
$url = 'https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage301460557392996.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_PLC0000037_2025_Japanese_WIN64.exe%22&'
$checksum = '444BDE2C1E35AA5892FE758A77CA0B518AB0CD96CF01A01DE41655472B260F1D'
$file = Join-Path $downloadsPath 'Autodesk\DWG TrueView 2025 - 日本語(Japanese) - (JA)\Setup.exe'
}

else {
$url = 'https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage811010659915909.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_PLC0000037_2025_English_WIN64.exe%22&'
$checksum = '89FEE1F0F66ADB825B945850CDEA7FD4C02832852DF67578C28CE5F370B6A821'
$file = Join-Path $downloadsPath 'Autodesk\DWG TrueView 2025 - English - (EN)\Setup.exe'
}

#2 DOWNLOAD
$packageArgsDownload = @{
  packageName    = 'DWG TrueView Installation Files'
  fileType       = 'exe'
  url            = $url
  softwareName   = 'DWG TrueView Installation Files*'
  checksum       = $checksum
  checksumType   = 'sha256'
  silentArgs     = "-q"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgsDownload

#3 UNINSTALL OLD
. $toolsDir\helpers.ps1
Invoke-UninstallDWGTrueView

#4 INSTALL
$packageArgs  = @{
  packageName    = 'DWG TrueView'
  fileType       = 'exe'
  file           = $file
  softwareName   = 'DWG TrueView*'
  silentArgs     = '-q'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgs
