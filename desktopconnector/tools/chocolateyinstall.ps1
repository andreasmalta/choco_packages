$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url = "https://up.autodesk.com/2017/CDX/AB4AADCC-F890-4B4F-A7A6-B0FBD2386796/DesktopConnector-x64-" + $Env:ChocolateyPackageVersion + ".exe"
$checksum = '2BA7FB70A5CE234E65789AC3FEA57143A3E76020CA758588C1BD093ACC5ABE18'

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
