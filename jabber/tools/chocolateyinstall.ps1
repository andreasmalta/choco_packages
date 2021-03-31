$ErrorActionPreference = 'Stop';

$url            = 'https://binaries.webex.com/static-content-pipeline/jabber-upgrade/production/jabberdesktop/apps/windows/public/14.0.0.305563/CiscoJabberSetup.msi'
$checksum_url   = '970C4C41AD71AAEEB04E2EB15D8A1DC8DEFAC339B8E6AB6F73EDFB8A335B7E0B'

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
