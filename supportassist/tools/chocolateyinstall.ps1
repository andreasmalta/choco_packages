$ErrorActionPreference = 'Stop';
$url = "https://downloads.dell.com/serviceability/catalog/SupportAssistx64-" + $env:chocolateyPackageVersion + ".msi"
$checksum = '939903E71C88261608730894FAE3DA9303EB4FDC81CE4EFB275069DA84223B72'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  url           = $url
  checksum      = $checksum
  checksumType  = 'sha256'
  softwareName  = 'SupportAssist*'
  silentArgs    = "/qn /norestart"
  validExitCodes= @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgs
