$ErrorActionPreference = 'Stop';

$url            = 'https://binaries.webex.com/jabberclientwindows/20220428041046/CiscoJabberSetup.msi'
$checksum_url   = '41E2C39FB6E405BEE8FC0667A9F7BF6109D78E0BD30F4836FDC95639F4F5AFB9'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  url           = $url
  checksum      = $checksum_url
  checksumType  = 'sha256'
  softwareName  = 'Cisco Jabber*'
  silentArgs    = "/qn /norestart"
  validExitCodes= @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgs
