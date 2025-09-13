$ErrorActionPreference = 'Stop';
$url = 'https://binaries.webex.com/jabberclientwindows/20250821063552/CiscoJabberSetup.msi'
$checksum = '7B4BA213E010177ACE296726A3A04C0CE35CC2035C519602D552B630002FED4F'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  url           = $url
  checksum      = $checksum
  checksumType  = 'sha256'
  softwareName  = 'Cisco Jabber*'
  silentArgs    = "/qn /norestart"
  validExitCodes= @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgs
