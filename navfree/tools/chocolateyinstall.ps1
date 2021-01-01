$ErrorActionPreference = 'Stop';
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url            = 'https://efulfillment.autodesk.com/NetSWDLD/2021/NAVFREE/7BD91E92-90EE-46D8-B383-3AAFDDC6FEDA/SFX/Autodesk_Navisworks_Freedom_2021_Multilingual_Win_64bit_dlm.sfx.exe'
$checksum_url   = '3F55FC2C3D00E63AD741F6EFC980C68B6DBF215F3755D575BC8B5909E87D6F10'
$file           = Join-Path $toolsDir 'Autodesk_Navisworks_Freedom_2021_Multilingual_Win_64bit_dlm\setup.exe'
$checksum_file  = '32AA0B3585DCA9FD5ED45CA527B16EDB358393406E1AD9D48CC766BD18EED44A'

$packageArgsURL = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = $url
  softwareName  = 'autodesk navisworks freedom*'
  checksum      = $checksum_url
  checksumType  = 'sha256'
  silentArgs    = "-suppresslaunch -d $toolsDir"
  validExitCodes= @(0, 3010, 1641)
}

$packageArgsFile = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  file          = $file
  softwareName  = 'autodesk navisworks freedom*'
  checksum      = $checksum_file
  checksumType  = 'sha256'
  silentArgs    = "/q /w"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgsURL
Install-ChocolateyInstallPackage @packageArgsFile
