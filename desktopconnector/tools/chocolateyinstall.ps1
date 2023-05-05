$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url = 'https://up.autodesk.com/2017/CDX/AB4AADCC-F890-4B4F-A7A6-B0FBD2386796/DesktopConnector-x64-16.2.0.2007.exe'
$checksum = '5092B6212BA1C1FB10E8C38033B5D0A68BFD410B06BBF214221CDD74C641F70D'

. $toolsDir\helpers.ps1
Invoke-UninstallOld

$packageArgsUnzip = @{
  packageName    = 'Autodesk Desktop Connector Installation Files'
  fileType       = 'exe'
  url            = $url
  softwareName   = 'Autodesk Desktop Connector Installation Files*'
  checksum       = $checksum
  checksumType   = 'sha256'
  silentArgs     = "-suppresslaunch -d $env:TEMP"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgsUnzip

$version = $Env:ChocolateyPackageVersion.replace('.','_')
$folder = "Autodesk_Desktop_Connector_" + $version + "_Win_64bit\Setup.exe"
$file = Join-Path $env:TEMP $folder

$packageArgs  = @{
  packageName    = 'Autodesk Desktop Connector'
  fileType       = 'exe'
  file           = $file
  softwareName   = 'Autodesk Desktop Connector*'
  silentArgs     = '-q'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgs

#Close software running in elevated mode
Stop-Process -Name "DesktopConnector*" -Force
