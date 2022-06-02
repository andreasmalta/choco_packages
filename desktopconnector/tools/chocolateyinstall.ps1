$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url = 'https://up.autodesk.com/2017/CDX/AB4AADCC-F890-4B4F-A7A6-B0FBD2386796/DesktopConnector-x64-15.7.0.1767.exe'
$checksum = 'A5620EAB18E32A2F1E564DA2FC1AC5B836B54FE9DAF6E78C275D4A8CD7E64080'
$file = Join-Path $env:TEMP 'Autodesk_Desktop_Connector_15_7_0_1767_Win_64bit\Setup.exe'

. $toolsDir\helpers.ps1
Invoke-UninstallOldAutodesk

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
