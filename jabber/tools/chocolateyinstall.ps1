$ErrorActionPreference = 'Stop';

$url            = 'https://binaries.webex.com/jabberclientwindows/20210902045826/CiscoJabberSetup.msi'
$checksum_url   = '5A771F7A9F1C62A21B911C103F79AE10A3807B661B137766F43008F9CD0F0FDE'

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
