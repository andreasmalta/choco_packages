$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url = 'https://ftp.ext.hp.com/pub/softpaq/sp142501-143000/sp142974.exe'
$checksum = 'FE6F4BE9AF781AED3A9A161FFFCDBC27C6EFC6AE3F0FAADCBCB10493FC0B7F8B'

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
