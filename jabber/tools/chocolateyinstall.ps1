$ErrorActionPreference = 'Stop';
$url = 'https://binaries.webex.com/jabberclientwindows/20230629072200/CiscoJabberSetup.msi'
$checksum = 'BD6FC1AFC6F49212179FB589A8BBD72CAE3EDF67B66F21F0D98BD45CF9106E15'

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
