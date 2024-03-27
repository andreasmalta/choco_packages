$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$downloadsPath = (New-Object -ComObject Shell.Application).Namespace('shell:Downloads').Self.Path

#UNINSTALL OLD VERSIONS
. $toolsDir\helpers.ps1
Invoke-UninstallOld

#EXTRACT AND INSTALL
$pp = Get-PackageParameters
if ($pp.'French') {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACD/2D15294B-542A-393B-9197-37F3D33DEFF3/SFX/DWGTrueView_2024_French_64bit_dlm.sfx.exe'
$checksum = '3E36ACDBD06EA7A348F57005546155B9B49538F6E821333D8157FE9958DE4A49'
$file = Join-Path $env:TEMP 'DWGTrueView_2024_French_64bit_dlm\setup.exe'
}

elseif ($pp.'Japanese') {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACD/9C18555B-A10A-36B3-9F02-4815156C448B/SFX/DWGTrueView_2024_Japanese_64bit_dlm.sfx.exe'
$checksum = 'C3FA4C1639BD2748B0F16725434A0F0F00DDA62FBDDF54907FA24D85DB722F61'
$file = Join-Path $env:TEMP 'DWGTrueView_2024_Japanese_64bit_dlm\setup.exe'
}

else {
$url = 'https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage147973027416102.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_PLC0000037_2025_English_WIN64.exe%22&'
$checksum = 'F4C8686E8A10E830E818B009E6F506A1D1313CCFC66663A14C497C33932229A9'
$file = Join-Path $downloadsPath 'Autodesk\DWG TrueView 2025 - English - (EN)\Setup.exe'
}

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

$packageArgs  = @{
  packageName    = 'DWG TrueView'
  fileType       = 'exe'
  file           = $file
  softwareName   = 'DWG TrueView*'
  silentArgs     = '-q'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgs
