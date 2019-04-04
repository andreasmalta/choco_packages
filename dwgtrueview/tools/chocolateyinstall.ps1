$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.autodesk.com/esd/dwgtrueview/2019/DWGTrueView_2019_Enu_32bit.sfx.exe'
$url64      = 'https://download.autodesk.com/esd/dwgtrueview/2019/DWGTrueView_2019_Enu_64bit.sfx.exe'
$fileLocation = Join-Path $toolsDir 'DWGTrueView_2019_Enu_32bit\Setup.exe'
$fileLocation64 = Join-Path $toolsDir 'DWGTrueView_2019_Enu_64bit\Setup.exe'
$checksum      = '60CAC33BCA4FFF14C17FA1E6CAD8CEF0D4D411E949CF0AF1CB46C107C288D590'
$checksum64    = '66A788BAFFC74B6C17FDD19D9D5D93B8EBC273C78D84F864F485664F31C68A37'


$packageArgs1 = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = $url
  url64bit      = $url64
  softwareName  = 'dwgtrueview*'
  checksum      = $checksum
  checksumType  = 'sha256'
  checksum64    = $checksum64
  checksumType64= 'sha256'
  silentArgs    = "-suppresslaunch -d $toolsDir"
}

$packageArgs2 = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  file          = $fileLocation
  file64        = $fileLocation64
  softwareName  = 'dwgtrueview*'
  checksum      = $checksum
  checksumType  = 'sha256'
  checksum64    = $checksum64
  checksumType64= 'sha256'
  silentArgs    = "/Q /W"
}

Install-ChocolateyPackage @packageArgs1
Install-ChocolateyInstallPackage @packageArgs2
