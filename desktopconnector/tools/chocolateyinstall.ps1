$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url = "https://up.autodesk.com/2017/CDX/AB4AADCC-F890-4B4F-A7A6-B0FBD2386796/DesktopConnector-x64-" + $Env:ChocolateyPackageVersion + ".exe"
#$url = "https://up.autodesk.com/2017/CDX/AB4AADCC-F890-4B4F-A7A6-B0FBD2386796/DesktopConnector-x64.exe"
$checksum = '49ECCD13308E123661462397FDA0603B1F9D69A8FAB91C2AA27ADC6D5FBBFF70'

. $toolsDir\helpers.ps1
Invoke-Uninstall15

$packageArgs = @{
  packageName    = 'Autodesk Desktop Connector'
  fileType       = 'exe'
  url            = $url
  softwareName   = 'Autodesk Desktop Connector*'
  checksum       = $checksum
  checksumType   = 'sha256'
  silentArgs     = '-q'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgs

#Close software running in elevated mode
Stop-Process -Name "DesktopConnector*" -Force
