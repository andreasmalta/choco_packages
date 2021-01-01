$ErrorActionPreference = 'Stop';
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url            = 'https://download.autodesk.com/us/support/files/sketchbook/sketchbook_2019/sketchbook_8.7.1.0_win64.exe'
$checksum_url   = '502D8B2125B838D4A3C24529CDBCF3988715F63B9B828E91740A13A808602837'
$extract        = Join-Path $toolsDir 'extract'
$isscript           = Join-Path $extract 'isscript.msi'
$checksum_isscript  = '61CF264166442D07099088D5FBE0ABBBF804184939A6B09EE5AA5EDCC8A90191'
$msi            = Join-Path $extract 'SketchBook8.0.0.msi'
$checksum_msi   = 'D6CA9B318813D1B410D8D212F282D6111EE74D64798F838E843CB8D662A32C0E'

$packageArgsURL = @{
  packageName   = $env:ChocolateyPackageName
  url           = $url
  checksum      = $checksum_url
  checksumType  = 'sha256'
  unziplocation = $extract
}
Install-ChocolateyZipPackage @packageArgsURL

$packageArgsISS = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  silentArgs    = "/qn /norestart"
  validExitCodes= @(0, 3010, 1641)
  softwareName  = 'SketchBook*'
  file          = $isscript
  checksum      = $checksum_isscript
  checksumType  = 'sha256'
}
Install-ChocolateyPackage @packageArgsISS

$packageArgsMSI = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  silentArgs    = "/qn /norestart"
  validExitCodes= @(0, 3010, 1641)
  softwareName  = 'SketchBook*'
  file          = $msi
  checksum      = $checksum_msi
  checksumType  = 'sha256'
}
Install-ChocolateyPackage @packageArgsMSI
