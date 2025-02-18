$ErrorActionPreference = 'Stop';

$url = 'https://downloads.solarwinds.com/solarwinds/Release/FreeTool/SolarWinds-TFTP-Server.zip'
$checksum = 'B5313D56A828052EF50BFBB0237689243D66AFE7E37836CC9B4584DC5714FDBD'

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
