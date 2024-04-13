$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$downloadsPath = (New-Object -ComObject Shell.Application).Namespace('shell:Downloads').Self.Path

#1 LANGUAGE SELECTION
$pp = Get-PackageParameters
if ($pp.'French') {
$url = 'Create_Installer_PLC0000037_2025_French_WIN64.exe'
$checksum = '2B2BBA43913B7D637424F3CED974BFFA765D958D3767B50DDB8A0C086C082817'
}

elseif ($pp.'Japanese') {
$url = 'Create_Installer_PLC0000037_2025_Japanese_WIN64.exe'
$checksum = '7FFDFAA74F6901D19871F8695A5D566C9C24A474D6A4547D7E61B80475E2C65B'
}

else {
$url = 'C:\temp\dwgtrueview\tools\Create_Installer_PLC0000037_2025_English_WIN64.exe'
#$url = 'https://github.com/andreasmalta/choco_packages/blob/master/dwgtrueview/Autodesk_DWG_TrueView_2025_en-US_setup_webinstall.exe'
$checksum = '95F44835389B272A7EEBC9FF494EE7DE776D12DF6FD8AE0520B9FAACB52E2358'
}

#2 UNINSTALL OLD
. $toolsDir\helpers.ps1
Invoke-UninstallDWGTrueView

#3 INSTALL
$packageArgsDownload = @{
  packageName    = 'DWG TrueView'
  fileType       = 'exe'
  url            = $url
  softwareName   = 'DWG TrueView*'
  checksum       = $checksum
  checksumType   = 'sha256'
  silentArgs     = "-q"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgsDownload
