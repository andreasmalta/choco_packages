$ErrorActionPreference = 'Stop';
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url            = 'https://trial2.autodesk.com/NetSWDLD/2021/ACD/80A03A2D-8FA9-43FD-9B26-1604CAD1D9CF/SFX/AutoCAD_2021_English_Win_64bit_dlm.sfx.exe'
$file           = Join-Path $toolsDir 'AutoCAD_2021_English_Win_64bit_dlm\Setup.exe'
$RegRebootRequired = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired"

$packageArgsExtract = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = $url
  softwareName  = 'autocad*'
  checksum      = 'AF68A217D9486AD633CA62D690E6AC1D179DDB5F33BE4A6B148CA71F588A1650'
  checksumType  = 'sha256'
  silentArgs    = "-suppresslaunch -d $toolsDir"
  validExitCodes= @(0, 3010, 1641)
}

$packageArgsSetup = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  file          = $file
  softwareName  = 'autocad*'
  checksum      = '32AA0B3585DCA9FD5ED45CA527B16EDB358393406E1AD9D48CC766BD18EED44A'
  checksumType  = 'sha256'
  silentArgs    = "/q /w"
  validExitCodes= @(0, 3010, 1641)
}

if (Test-path $RegRebootRequired)
{
    Remove-Item -Path $RegRebootRequired
}
Install-ChocolateyPackage @packageArgsExtract
Install-ChocolateyInstallPackage @packageArgsSetup
