$ErrorActionPreference = 'Stop';

$url = 'https://ftp.hp.com/pub/tcimages/EasyUpdate/Images/ThinUpdateRelease/2_7_46/HPThinUpdate-2.7.46-Win64.msi'
$checksum = 'CFE16932D9426A84E3EAA9C8E336BE3CAF5C4DFABE8A2E36BFF6DAE109012917'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = $url
  checksum       = $checksum
  checksumType   = 'sha256'
  softwareName   = 'hp thinupdate*'
  silentArgs     = "/qn /norestart"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgs
