$ErrorActionPreference = 'Stop';

$url = 'https://downloads.solarwinds.com/solarwinds/Release/FreeTool/SolarWinds-TFTP-Server.zip'
$checksum = '256BD92DB5C06FFA9A303546BFDCB4542A6B1ACD46E77DEA3879693147C4387F'

$packageArgsURL = @{
  packageName    = $env:ChocolateyPackageName
  url            = $url
  checksum       = $checksum
  checksumType   = 'sha256'
  unziplocation  = $env:TEMP
}
Install-ChocolateyZipPackage @packageArgsURL

$setup = Join-Path $env:TEMP 'TFTPInstaller.msi'
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  file           = $setup
  softwareName   = 'SolarWinds TFTP Server*'
  silentArgs     = "/qn /norestart"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgs
