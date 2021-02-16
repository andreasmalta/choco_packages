$ErrorActionPreference = 'Stop';

$url            = 'https://download.autodesk.com/us/support/autodesk_inventor_view_2021/inventor_view_2021_english_win_64bit_dlm.sfx.exe'
$checksum_url   = '3339302E1925EDCED8965879BB7236C3E7635A4899E8E8345336F68DEBDA468F'
$file           = Join-Path $env:TEMP 'inventor_view_2021_english_win_64bit_dlm\setup.exe'
$checksum_file  = '32AA0B3585DCA9FD5ED45CA527B16EDB358393406E1AD9D48CC766BD18EED44A'

$packageArgsURL = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = $url
  softwareName  = 'autodesk inventor view*'
  checksum      = $checksum_url
  checksumType  = 'sha256'
  silentArgs    = "-suppresslaunch -d $env:TEMP"
  validExitCodes= @(0, 3010, 1641)
}

$packageArgsFile = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  file          = $file
  softwareName  = 'autodesk inventor view*'
  checksum      = $checksum_file
  checksumType  = 'sha256'
  silentArgs    = "/q /w"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgsURL
Install-ChocolateyInstallPackage @packageArgsFile
