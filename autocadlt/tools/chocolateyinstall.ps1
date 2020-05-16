$ErrorActionPreference = 'Stop';
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url            = 'https://trial2.autodesk.com/NetSWDLD/2021/ACDLT/B1A1D73D-D894-441D-803D-BFFCF11A1340/SFX/AutoCAD_LT_2021_SWL_English_Win_64bit_dlm.sfx.exe'
$file           = Join-Path $toolsDir 'AutoCAD_LT_2021_SWL_English_Win_64bit_dlm\Setup.exe'
$RegRebootRequired = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired"

$packageArgsExtract = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = $url
  softwareName  = 'autocadlt*'
  checksum      = 'B7B6551918F352D7D8010DE77F3DD869A2B5E774F7D628066BB446634DF9E5E3'
  checksumType  = 'sha256'
  silentArgs    = "-suppresslaunch -d $toolsDir"
  validExitCodes= @(0, 3010, 1641)
}

$packageArgsSetup = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  file          = $file
  softwareName  = 'autocadlt*'
  checksum      = '32AA0B3585DCA9FD5ED45CA527B16EDB358393406E1AD9D48CC766BD18EED44A'
  checksumType  = 'sha256'
  silentArgs    = "/q /w"
  validExitCodes= @(0, 3010, 1641)
}

if (Test-path $RegRebootRequired) {
    Remove-Item -Path $RegRebootRequired
    Install-ChocolateyPackage @packageArgsExtract
    Install-ChocolateyInstallPackage @packageArgsSetup
    New-Item -Path $RegRebootRequired
}
else {
    Install-ChocolateyPackage @packageArgsExtract
    Install-ChocolateyInstallPackage @packageArgsSetup
}