$ErrorActionPreference = 'Stop';

$url            = 'https://binaries.webex.com/jabberclientwindows/20211230033337/CiscoJabberSetup.msi'
$checksum_url   = 'AFB8156191B8CB47196B9BCAC218DF164D7DF59DE83C84D5B42CBCA3442C7E5A'

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
