$ErrorActionPreference = 'Stop';
$url = 'https://binaries.webex.com/jabberclientwindows/20240401022042/CiscoJabberSetup.msi'
$checksum = 'F71C58883EFD66CFACEAD09637DF1F3A497D6FFA211B178FE491B1B550593BF9'

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
