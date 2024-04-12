$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$downloadsPath = (New-Object -ComObject Shell.Application).Namespace('shell:Downloads').Self.Path

#1 LANGUAGE SELECTION
$pp = Get-PackageParameters
if ($pp.'French') {
$url = 'https://cdn.jsdelivr.net/gh/andreasmalta/choco_packages@master/dwgtrueview/Autodesk_DWG_TrueView_2025_fr-FR_setup_webinstall.exe'
$checksum = 'D7CB1D080408C55DB49A510345F6ABD409ECFA0C166284019E441EC35C6CD3CF'
}

elseif ($pp.'Japanese') {
$url = 'https://cdn.jsdelivr.net/gh/andreasmalta/choco_packages@master/dwgtrueview/Autodesk_DWG_TrueView_2025_ja-JP_setup_webinstall.exe'
$checksum = 'D328C2D5E63D483E9D4D5D0EF658124DBED51BD083B3F01A5FF5D56CC8947BF5'
}

else {
$url = 'https://cdn.jsdelivr.net/gh/andreasmalta/choco_packages@master/dwgtrueview/Autodesk_DWG_TrueView_2025_en-US_setup_webinstall.exe'
$checksum = '1145E637E55C6C7611FFCBA3CF080CB880B66EC7219E2334EDF9FF274610C2D7'
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
