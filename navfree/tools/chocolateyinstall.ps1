$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#UNINSTALL OLD VERSIONS
. $toolsDir\helpers.ps1
Invoke-UninstallOld

#EXTRACT AND INSTALL
$url = 'Z:\Autodesk_Navisworks_Freedom_2024_Win_64bit_dlm.sfx.exe'
#$url = 'https://efulfillment.autodesk.com/NetSWDLD/2024/NAVFREE/00C73B59-6FB8-32FF-B85F-F4CF5EBE4C3F/SFX/Autodesk_Navisworks_Freedom_2024_Win_64bit_dlm.sfx.exe'
$checksum = '38932F5350F849D22C839DE6C00F4A1A975F7BC835A5190014C082162041834F'
$file = Join-Path $env:TEMP 'Autodesk_Navisworks_Freedom_2024_Win_64bit_dlm\Setup.exe'

$packageArgsUnzip = @{
  packageName    = 'Navisworks Freedom Installation Files'
  fileType       = 'exe'
  url            = $url
  softwareName   = 'Navisworks Freedom Installation Files*'
  checksum       = $checksum
  checksumType   = 'sha256'
  silentArgs     = "-suppresslaunch -d $env:TEMP"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgsUnzip

$packageArgs  = @{
  packageName    = 'Navisworks Freedom'
  fileType       = 'exe'
  file           = $file
  softwareName   = 'Navisworks Freedom*'
  silentArgs     = '-q'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgs
