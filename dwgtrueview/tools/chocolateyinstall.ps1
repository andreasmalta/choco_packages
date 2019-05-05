$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url      = 'https://trial2.autodesk.com/NetSWDLD/2020/ACD/79D9B4F2-2A92-453A-A1A4-CF3F3A09B77D/SFX/DWGTrueView_2020_Enu_64bit_dlm.sfx.exe'
$checksum_url    = 'B8576EB643C879CB078F6779D45131625285664D9621B00C0B02B00073383FAD'
$file = Join-Path $toolsDir 'DWGTrueView_2020_Enu_64bit_dlm\Setup.exe'
$checksum_file    = 'A42B7914F3834871C84404961432BADF11A8E839BB19BA2014EF8F91202DA5B0'
$RegRebootRequired = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired"

$packageArgs1 = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url64bit      = $url
  softwareName  = 'dwgtrueview*'
  checksum64    = $checksum_url
  checksumType64= 'sha256'
  silentArgs    = "-suppresslaunch -d $toolsDir"
  validExitCodes= @(0, 3010, 1641)
}

$packageArgs2 = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  file64        = $file
  softwareName  = 'dwgtrueview*'
  checksum64    = $checksum_file
  checksumType64= 'sha256'
  silentArgs    = "/q /w"
  validExitCodes= @(0, 3010, 1641)
}

if (Test-path $RegRebootRequired)
{
    Remove-Item -Path $RegRebootRequired
}
Install-ChocolateyPackage @packageArgs1
Install-ChocolateyInstallPackage @packageArgs2
