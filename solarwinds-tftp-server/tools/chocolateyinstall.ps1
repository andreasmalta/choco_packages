$ErrorActionPreference = 'Stop';
$url = 'https://downloads.solarwinds.com/solarwinds/Release/FreeTool/SolarWinds-TFTP-Server.zip'
$checksum = 'F919CF9BE11EFB6958AFCC54434B39B05F5D858138213F0A3698BA5B3CB7A257'

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
