$ErrorActionPreference = 'Stop';

$url = 'https://downloads.solarwinds.com/solarwinds/Release/FreeTool/SolarWinds-TFTP-Server.zip'
$checksum = '59AA193ED11A14807FEFFA32F88D3D46D4ECE77C75C5EFC6F1B5F04EDE1176E8'

$packageArgsURL = @{
  packageName    = $env:ChocolateyPackageName
  url            = $url
  checksum       = $checksum
  checksumType   = 'sha256'
  unziplocation  = $env:TEMP
}
Install-ChocolateyZipPackage @packageArgsURL

$setup = Join-Path $env:TEMP 'SolarWinds-TFTP-Server.msi'
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  file           = $setup
  softwareName   = 'SolarWinds TFTP Server*'
  silentArgs     = "/qn /norestart"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgs
