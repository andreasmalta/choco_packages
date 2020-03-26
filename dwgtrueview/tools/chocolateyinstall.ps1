$ErrorActionPreference = 'Stop';
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url            = 'https://trial2.autodesk.com/NetSWDLD/2021/ACD/E6A1E1F6-4270-4D64-8BD5-CF3F3A09B77D/SFX/DWGTrueView_2021_English_64bit_dlm.sfx.exe'

$packageArgs1 = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '757C80DCD13D71F1EC09065BDB8F1E0F6994B773231440C008107DCAF4E3C78E'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs1



#$file = Join-Path $toolsDir 'DWGTrueView_2020_Enu_64bit_dlm\Setup.exe'
#$checksum_file    = 'A42B7914F3834871C84404961432BADF11A8E839BB19BA2014EF8F91202DA5B0'
#$RegRebootRequired = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired"

#$packageArgs1 = @{
#  packageName   = $env:ChocolateyPackageName
#  fileType      = 'exe'
#  url           = $url
#  softwareName  = 'dwgtrueview*'
#  checksum      = '757C80DCD13D71F1EC09065BDB8F1E0F6994B773231440C008107DCAF4E3C78E'
#  checksumType  = 'sha256'
#  silentArgs    = "-suppresslaunch -d $toolsDir"
#  validExitCodes= @(0, 3010, 1641)
#}

#$packageArgs2 = @{
#  packageName   = $env:ChocolateyPackageName
#  fileType      = 'exe'
#  file          = $file
#  softwareName  = 'dwgtrueview*'
#  checksum      = '757C80DCD13D71F1EC09065BDB8F1E0F6994B773231440C008107DCAF4E3C78E'
#  checksumType  = 'sha256'
#  silentArgs    = "/q /w"
#  validExitCodes= @(0, 3010, 1641)
#}

#if (Test-path $RegRebootRequired)
#{
#    Remove-Item -Path $RegRebootRequired
#}
#Install-ChocolateyPackage @packageArgs1
#Install-ChocolateyInstallPackage @packageArgs2
#