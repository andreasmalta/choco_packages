$ErrorActionPreference = 'Stop';
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url            = 'https://trial2.autodesk.com/NetSWDLD/2021/ACD/E6A1E1F6-4270-4D64-8BD5-CF3F3A09B77D/SFX/DWGTrueView_2021_English_64bit_dlm.sfx.exe'
$file           = Join-Path $toolsDir 'DWGTrueView_2021_English_64bit_dlm\Setup.exe'
$RegRebootRequired = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired"

$packageArgs1 = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = $url
  softwareName  = 'dwgtrueview*'
  checksum      = '47DBDE0EA38F195433902836D3944906519B34384D058452CC7F8A893A793480'
  checksumType  = 'sha256'
  silentArgs    = "-suppresslaunch -d $toolsDir"
  validExitCodes= @(0, 3010, 1641)
}

$packageArgs2 = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  file          = $file
  softwareName  = 'dwgtrueview*'
  checksum      = '32AA0B3585DCA9FD5ED45CA527B16EDB358393406E1AD9D48CC766BD18EED44A'
  checksumType  = 'sha256'
  silentArgs    = "/q /w"
  validExitCodes= @(0, 3010, 1641)
}

if (Test-path $RegRebootRequired)
{
    Remove-Item -Path $RegRebootRequired
}
Install-ChocolateyPackage @packageArgs1
Install-ChocolateyInstallPackage @packageArgs2
