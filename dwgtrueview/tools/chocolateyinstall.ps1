$ErrorActionPreference = 'Stop';
$fileLocation = Join-Path $env:ChocolateyInstall 'lib\dwgtrueview.install\tools\DWGTrueView_2019_Enu_32bit\Setup.exe'
$fileLocation64 = Join-Path $env:ChocolateyInstall 'lib\dwgtrueview.install\tools\DWGTrueView_2019_Enu_64bit\Setup.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  file          = $fileLocation
  file64        = $fileLocation64
  softwareName  = 'dwgtrueview*'
  checksum      = '60CAC33BCA4FFF14C17FA1E6CAD8CEF0D4D411E949CF0AF1CB46C107C288D590'
  checksumType  = 'sha256'
  checksum64    = '66A788BAFFC74B6C17FDD19D9D5D93B8EBC273C78D84F864F485664F31C68A37'
  checksumType64= 'sha256'
  silentArgs    = "/Q /W"
}

Install-ChocolateyInstallPackage @packageArgs
