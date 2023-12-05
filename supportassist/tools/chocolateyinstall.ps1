$ErrorActionPreference = 'Stop';

$url_msi = "https://downloads.dell.com/serviceability/catalog/SupportAssistx64-" + $Env:ChocolateyPackageVersion + ".msi"
$checksum_msi = '4864372EA076A17199E5F345EFC4BE7E073F263E83B68B32B3F4DC45F11E24E3'
$url_msp = "https://downloads.dell.com/serviceability/catalog/SupportAssistx64-" + $Env:ChocolateyPackageVersion + ".msp"
$checksum_msp = '1133FA489B8292847A342A710A8FD0D4FC29775A6F438B65CE9BF1C94DABDB60'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  url           = $url_msi
  softwareName  = 'SupportAssist*'
  checksum      = $checksum_msi
  checksumType  = 'sha256'
  silentArgs     = "/qn /norestart"
  validExitCodes= @(0, 1603, 3010, 1641)
}
Install-ChocolateyPackage @packageArgs

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msp'
  url           = $url_msp
  softwareName  = 'SupportAssist*'
  checksum      = $checksum_msp
  checksumType  = 'sha256'
  silentArgs     = "/qn /norestart"
  validExitCodes= @(0, 1642, 3010, 1641)
}
Install-ChocolateyPackage @packageArgs
