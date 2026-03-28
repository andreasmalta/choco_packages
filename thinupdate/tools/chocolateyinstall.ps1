$ErrorActionPreference = 'Stop';

$url = 'https://ftp.hp.com/pub/tcimages/EasyUpdate/Images/ThinUpdateRelease/2_7_49/HPThinUpdate-2.7.49-Win64.msi'
$checksum = 'F715F749FDBDABA1817D29F28A14506C1B85573C8CC3968AB53750524C0F5E10'

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
