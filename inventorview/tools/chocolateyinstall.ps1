$ErrorActionPreference = 'Stop';

$url            = 'https://download.autodesk.com/us/support/autodesk_inventor_view_2021/inventor_view_2021_english_win_64bit_dlm.sfx.exe'
$checksum_url   = '93F08609AC2E3CAC05E5D836BF2C6FFDD7256572351C39C9ACB4686B2581B7AE'
$file           = Join-Path $env:TEMP 'Inventor_View_2021_English_Win_64bit_DLM\setup.exe'

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
  silentArgs    = "/q /w"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgsURL
Install-ChocolateyInstallPackage @packageArgsFile
