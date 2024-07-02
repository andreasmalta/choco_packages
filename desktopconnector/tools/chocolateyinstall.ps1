$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url = "https://up.autodesk.com/2017/CDX/AB4AADCC-F890-4B4F-A7A6-B0FBD2386796/DesktopConnector-x64-" + $Env:ChocolateyPackageVersion + ".exe"
$checksum = '8DBA9030A752DD16733B9B318017D828D3A7215A6052562163FB2E43D3B5BDF7'

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
