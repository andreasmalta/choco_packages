$ErrorActionPreference = 'Stop';
$url = 'https://downloads.solarwinds.com/solarwinds/Release/FreeTool/SolarWinds-TFTP-Server.zip'
$checksum = 'C00021B237A03CE2843DD39F8206339D62B97C211F1EF5D127558579286D12B3'

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
