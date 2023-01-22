$ErrorActionPreference = 'Stop';

$url = 'https://binaries.webex.com/jabberclientwindows/20230112034206/CiscoJabberSetup.msi'
$checksum = 'BEA77548C59BCBCE77DCC8858EDE5844400DEFE78D2815160E1B1629CA587AC7'

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
