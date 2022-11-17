$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

. $toolsDir\helpers.ps1
Invoke-UninstallOldClickShare

$url            = "https://www.barco.com/services/website/en/TdeFiles/Download?FileNumber=R3306194&TdeType=3&MajorVersion=04&MinorVersion=25&PatchVersion=00&BuildVersion=015&ShowDownloadPage=False"
$checksum_url   = '83131DFC9F813947B3DBD4846A0B1254A236F55983168C1C82C23671C2CCD3EC'
$file           = Join-Path $env:TEMP 'ClickShare_Installer.msi'

$packageArgsURL = @{
  packageName   = $env:ChocolateyPackageName
  file          = $url
  checksum      = $checksum_url
  checksumType  = 'sha256'
  unziplocation = $env:TEMP
}
Install-ChocolateyZipPackage @packageArgsURL

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  file          = $file
  softwareName  = 'clickshare*'
  silentArgs    = "/qn ACCEPT_EULA=YES /norestart"
  validExitCodes= @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgs
