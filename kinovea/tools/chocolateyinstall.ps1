
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.kinovea.org/setup/kinovea.0.8.27/Kinovea-0.8.27-win32.exe'
$url64      = 'https://www.kinovea.org/setup/kinovea.0.8.27/Kinovea-0.8.27-x64.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64bit      = $url64

  softwareName  = 'kinovea*'

  checksum      = 'B6210BB8C80034F4D995724D5B2D53BBBF750934F8681E4DDBB6C441BF51AC78'
  checksumType  = 'sha256'
  checksum64    = '5DAD4877E9F166DE7C9318B4A93517DD7B8FD5ED6A773F869E9F0A7D7C2CCCCF'
  checksumType64= 'sha256'

  silentArgs    = "/S"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
