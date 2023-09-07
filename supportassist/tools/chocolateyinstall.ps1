$ErrorActionPreference = 'Stop';

$url = "https://downloads.dell.com/serviceability/catalog/SupportAssistx64-" + $Env:ChocolateyPackageVersion + ".msi"
$checksum = '2C3AA11080F1E90874A0F8DFE6ECEBB238B8D62F79B0D0A2A7757C750F53C49C'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  url           = $url
  softwareName  = 'SupportAssist*'
  checksum      = $checksum
  checksumType  = 'sha256'
  silentArgs     = "/qn /norestart"
  validExitCodes= @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgs
