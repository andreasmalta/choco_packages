$ErrorActionPreference = 'Stop';
$url            = 'https://ftp.ext.hp.com/pub/softpaq/sp118001-118500/sp118349.exe'
$checksum       = '3B25F9571CCBFE41CC15CF37AAC9DF42C1595E593FCF2AD5EDCF6C9ECF6797C7'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  file          = $url
  softwareName  = 'hp pc hardware diagnostics*'
  checksum      = $checksum
  checksumType  = 'sha256'
  silentArgs    = "/S"
  validExitCodes= @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgs
