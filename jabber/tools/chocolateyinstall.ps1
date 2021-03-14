$ErrorActionPreference = 'Stop';

$url            = 'https://binaries.webex.com/static-content-pipeline/jabber-upgrade/production/jabberdesktop/apps/windows/public/latest/CiscoJabberSetup.msi'
$checksum_url   = 'D1B27A0E31C6C7053A9070D48D6B3494C00AB51EA9C3D45DE243DD986C2AE1B8'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  url           = $url
  checksum      = $checksum_url
  checksumType  = 'sha256'
  softwareName  = 'Cisco Jabber*'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgs
