$ErrorActionPreference = 'Stop';

$url = 'https://ftp.hp.com/pub/tcimages/EasyUpdate/Images/ThinUpdateRelease/2_8_1/HPThinUpdate-2.8.1-Win64.msi'
$checksum = '8BD47037C2FF58BE5AA99CD6C80DCA0D3D632B3BE03C5618DCA61ED1993881CD'

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
