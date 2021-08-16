$ErrorActionPreference = 'Stop';

$url             = 'https://downloads.solarwinds.com/solarwinds/Release/FreeTool/SolarWinds-TFTP-Server.zip'
$checksum        = '2D5CB035F23CD25BE5F0DAA391E6A21FB04A52E968991F363E755B92F2ACC2D6'

$packageArgsURL = @{
  packageName    = $env:ChocolateyPackageName
  url            = $url
  checksum       = $checksum
  checksumType   = 'sha256'
  unziplocation  = $env:TEMP
}
Install-ChocolateyZipPackage @packageArgsURL

$extract = Join-Path $env:TEMP 'TFTP-Server-Installer.exe'
$packageArgsExtract = @{
  packageName    = $env:ChocolateyPackageName
  url            = $extract
  unziplocation  = $env:TEMP
}
Install-ChocolateyZipPackage @packageArgsExtract

$setup = Join-Path $env:TEMP '$_2_\SubInstallers\TFTPInstaller.msi'
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  file           = $setup
  softwareName   = 'SolarWinds TFTP Server*'
  silentArgs     = "/qn /norestart"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgs
