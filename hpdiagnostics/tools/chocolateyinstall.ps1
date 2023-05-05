$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url = 'https://ftp.hp.com/pub/softpaq/sp146501-147000/sp146683.exe'
$checksum = '70658EF3B5708ABB0F6D16A4093421B565BA32E2D7C7ECEB818B8CBA1BE6D7AE'

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
