$ErrorActionPreference = 'Stop';

$url            = 'https://barcoprdwebsitefs.azureedge.net/barcoprdfs/Data/secure/downloads/tde/Active/SoftwareFiles/ApplicationSoftware/R3306183_27_ApplicationSw.zip?zBAiid5DQXjIm0jC_qm6h2uPlTRnJT9d2TloOezN2swxiMSlerltfvPxfANUfxhrvv_ubYJaX-UiWqmAiZxncqbqZ3TG'
$checksum_url   = '10B5AA58875D4984878FF95077BA800BE19FDEDAE007AE2C50B4C9C902C62763'
$file           = Join-Path $env:TEMP 'ClickShare_Setup.exe'

$packageArgsURL = @{
  packageName   = $env:ChocolateyPackageName
  file          = $url
  checksum      = $checksum_url
  checksumType  = 'sha256'
  unziplocation = $env:TEMP
}
Install-ChocolateyZipPackage @packageArgsURL

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  file          = $file
  softwareName  = 'clickshare*'
  silentArgs    = "/S"
  validExitCodes= @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgs
