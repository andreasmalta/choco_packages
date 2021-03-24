$ErrorActionPreference = 'Stop';

$pp = Get-PackageParameters
if ($pp.'French') {
Write-Host "INSTALLING FRENCH DWG TRUEVIEW"
$url           = 'https://efulfillment.autodesk.com/NetSWDLD/2022/ACD/D7A6621A-1A6A-3DAC-BBD2-9EB566035195/SFX/DWGTrueView_2022_English_64bit_dlm.sfx.exe'
$checksum      = '847731F2FD7C8E6DE98618E3C51F9D0E5E47CBC990B713BA1FB620AC1E09D3C3'
$unzip         = Join-Path $env:TEMP 'DWGTrueView_2021_English_64bit_dlm\Setup.exe'
}

elseif ($pp.'Japanese') {
Write-Host "INSTALLING JAPANESE DWG TRUEVIEW"
$url           = 'https://efulfillment.autodesk.com/NetSWDLD/2022/ACD/D7A6621A-1A6A-3DAC-BBD2-9EB566035195/SFX/DWGTrueView_2022_English_64bit_dlm.sfx.exe'
$checksum      = '847731F2FD7C8E6DE98618E3C51F9D0E5E47CBC990B713BA1FB620AC1E09D3C3'
$unzip         = Join-Path $env:TEMP 'DWGTrueView_2021_English_64bit_dlm\Setup.exe'
}

else {
Write-Host "INSTALLING ENGLISH DWG TRUEVIEW"
$url           = 'https://efulfillment.autodesk.com/NetSWDLD/2022/ACD/D7A6621A-1A6A-3DAC-BBD2-9EB566035195/SFX/DWGTrueView_2022_English_64bit_dlm.sfx.exe'
$checksum      = '847731F2FD7C8E6DE98618E3C51F9D0E5E47CBC990B713BA1FB620AC1E09D3C3'
$unzip         = Join-Path $env:TEMP 'DWGTrueView_2021_English_64bit_dlm\Setup.exe'
}

$packageArgs1 = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = $url
  softwareName  = 'dwgtrueview*'
  checksum      = $checksum
  checksumType  = 'sha256'
  silentArgs    = "-suppresslaunch -d $env:TEMP"
  validExitCodes= @(0, 3010, 1641)
}

$packageArgs2 = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  file          = $unzip
  softwareName  = 'dwgtrueview*'
  silentArgs    = "/q /w"
  validExitCodes= @(0, 3010, 1641)
}

$RegRebootRequired = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired"
if (Test-path $RegRebootRequired)
{
    Remove-Item -Path $RegRebootRequired
}
Install-ChocolateyPackage @packageArgs1
Install-ChocolateyInstallPackage @packageArgs2
