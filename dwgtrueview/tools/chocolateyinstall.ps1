$ErrorActionPreference = 'Stop';

$pp = Get-PackageParameters
if ($pp.'French') {
Write-Host "INSTALLING FRENCH DWG TRUEVIEW"
$url           = 'https://efulfillment.autodesk.com/NetSWDLD/2022/ACD/14440FCD-9E86-3EBF-855F-4478C8A683D6/SFX/DWGTrueView_2022_French_64bit_dlm.sfx.exe'
$checksum      = '7DA5DA429FDB9619B8EDC83373F3C82C7DFD54258925E642A246B39FB3F3DC2B'
$unzip         = Join-Path $env:TEMP 'DWGTrueView_2021_English_64bit_dlm\Setup.exe'
}

elseif ($pp.'Japanese') {
Write-Host "INSTALLING JAPANESE DWG TRUEVIEW"
$url           = 'https://efulfillment.autodesk.com/NetSWDLD/2022/ACD/51735649-303B-3616-ABBC-448420E5C835/SFX/DWGTrueView_2022_Japanese_64bit_dlm.sfx.exe'
$checksum      = 'CAA0D4F25981C68C6FB9F40CA4F3B478D57F1289B6052F8656520324D71DD08B'
$unzip         = Join-Path $env:TEMP 'DWGTrueView_2021_English_64bit_dlm\Setup.exe'
}

else {
Write-Host "INSTALLING ENGLISH DWG TRUEVIEW"
$url           = 'https://efulfillment.autodesk.com/NetSWDLD/2022/ACD/D7A6621A-1A6A-3DAC-BBD2-9EB566035195/SFX/DWGTrueView_2022_English_64bit_dlm.sfx.exe'
$checksum      = 'B154E86B005C51232755BA99B89DE0D402D21FD1B42F32021290EDCD2BDC4193'
$unzip         = Join-Path $env:TEMP 'DWGTrueView_2022_English_64bit_dlm\Setup.exe'
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
