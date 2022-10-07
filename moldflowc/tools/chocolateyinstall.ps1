$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#ADJUST FOR LATEST VERSION
$url = 'https://damassets.autodesk.net/content/dam/autodesk/www/products/moldflow/files/MFC_2023_FCS_Multilingual_Win_64bit_dlm.sfx.exe'
$checksum = '86AA9230E79D7C322F821A48FFFE27FF6D054BF2D9757E0353E7DF0D3E24DCD6'
$file = Join-Path $env:TEMP 'MFC_2023_FCS_Multilingual_Win_64bit_dlm\setup.exe'

#REMOVE OLD VERSIONS
. $toolsDir\helpers.ps1
Invoke-UninstallOldMFC

#REMOVE REBOOT REQUESTS
$RegRebootRequired = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired"
if (Test-path $RegRebootRequired) { Remove-Item -Path $RegRebootRequired }

#EXTRACT & INSTALL
$packageArgsUnzip = @{
  packageName    = 'MFC Installation Files'
  fileType       = 'exe'
  url            = $url
  softwareName   = 'MFC Installation Files*'
  checksum       = $checksum
  checksumType   = 'sha256'
  silentArgs     = "-suppresslaunch -d $env:TEMP"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgsUnzip

$packageArgs  = @{
  packageName    = 'Moldflow Communicator'
  fileType       = 'exe'
  file           = $file
  softwareName   = 'Moldflow Communicator*'
  silentArgs     = '-q'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgs
