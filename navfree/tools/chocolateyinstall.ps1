$ErrorActionPreference = 'Stop';
$url            = 'https://efulfillment.autodesk.com/NetSWDLD/2022/NAVFREE/087B95DF-F444-3F18-B633-4A7A0A0488A4/SFX/Autodesk_Navisworks_Freedom_2022_Win_64bit_dlm.sfx.exe'
$checksum_url   = 'xxxx'
$file           = Join-Path $env:TEMP 'Autodesk_Navisworks_Freedom_2022_Win_64bit_dlm\setup.exe'

$packageArgsURL = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = $url
  softwareName  = 'autodesk navisworks freedom*'
  checksum      = $checksum_url
  checksumType  = 'sha256'
  silentArgs    = "-suppresslaunch -d $env:TEMP"
  validExitCodes= @(0, 3010, 1641)
}

$packageArgsFile = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  file          = $file
  softwareName  = 'autodesk navisworks freedom*'
  silentArgs    = "/q /w"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgsURL
Install-ChocolateyInstallPackage @packageArgsFile
