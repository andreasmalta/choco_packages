$ErrorActionPreference = 'Stop';
$url = 'https://binaries.webex.com/jabberclientwindows/20231227052853/CiscoJabberSetup.msi'
$checksum = '5CE8B28752645E72B9EE2587E97B21A332EC44A91E08142F51200F5223FCA060'

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
