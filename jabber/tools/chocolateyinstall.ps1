$ErrorActionPreference = 'Stop';
$url = 'https://binaries.webex.com/jabberclientwindows/20250430023819/CiscoJabberSetup.msi'
$checksum = '975CF4E369DCF64F83F4E04666846E935CF895BB48B1A4D31C1F4B43B221E719'

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
