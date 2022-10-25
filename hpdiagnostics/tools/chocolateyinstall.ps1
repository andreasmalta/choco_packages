$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url = 'https://ftp.ext.hp.com/pub/softpaq/sp142501-143000/sp142974.exe'
$checksum = 'FFC66FA68A14D1B359C1552956138165B1323D520A8A13EE8B881DE4E5529AF0'

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
