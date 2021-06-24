$ErrorActionPreference = 'Stop';

$url            = 'https://binaries.webex.com/jabberclientwindows/20210603033202/CiscoJabberSetup.msi'
$checksum_url   = '843D241B0AEFE7C5D326FDF94ED25ADFCACEF8A3687B24BEE0C280D0DF73CFA4'

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
