$ErrorActionPreference = 'Stop';

$url = 'https://ftp.hp.com/pub/tcimages/EasyUpdate/Images/ThinUpdateRelease/2_7_52/HPThinUpdate-2.7.52-Win64.msi'
$checksum = 'EF656F4A844D2680E9C191E9267040425421D6265EEB55D047868F61A3CD22C6'

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
