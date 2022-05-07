$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url = 'https://up.autodesk.com/2017/CDX/AB4AADCC-F890-4B4F-A7A6-B0FBD2386796/DesktopConnector-x64-15.6.0.1752.exe'
$checksum = 'BD36E711A8270EBFAACD85EB5A30D65C5373B0AAA7D768DA1D39F18E63514028'
$file = Join-Path $env:TEMP 'Autodesk_Desktop_Connector_15_6_0_1752_Win_64bit\Setup.exe'

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
