$ErrorActionPreference = 'Stop';

$url_msi = "https://downloads.dell.com/serviceability/catalog/SupportAssistx64-" + $Env:ChocolateyPackageVersion + ".msi"
$checksum_msi = '2C3AA11080F1E90874A0F8DFE6ECEBB238B8D62F79B0D0A2A7757C750F53C49C'
$url_msp = "https://downloads.dell.com/serviceability/catalog/SupportAssistx64-" + $Env:ChocolateyPackageVersion + ".msp"
$checksum_msp = '024529C760808A73EAC86FAB587332C6689E4505CAD325F19932C9E998FC363A'

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
