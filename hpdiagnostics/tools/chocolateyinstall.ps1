$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url = 'https://ftp.ext.hp.com/pub/softpaq/sp144501-145000/sp144583.exe'
$checksum = '951B6545E6A4B7A8863FB2BB90C043E1E14E03B17BB645E4A83E820CCF8637CB'

#Uninstall old version before upgrade
. $toolsDir\helpers.ps1
Invoke-Uninstall

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
