$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url = 'https://ftp.ext.hp.com/pub/softpaq/sp144001-144500/sp144027.exe'
$checksum = 'B7EC2843A5319B46CC0E44CFAA78748BD2FCA04529EA68C0082DA6E4FF04FFC6'

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
