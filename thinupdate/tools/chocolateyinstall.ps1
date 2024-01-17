$ErrorActionPreference = 'Stop';

$url             = 'https://ftp.hp.com/pub/tcimages/EasyUpdate/ThinUpdate/Win64/HPThinUpdate-02.07.15-Win64.msi'
$checksum        = 'F0729D1BF896A824B7C5C47F7141425B8A4E28751B2F3B8DD9DCE57E20A332A0'

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
