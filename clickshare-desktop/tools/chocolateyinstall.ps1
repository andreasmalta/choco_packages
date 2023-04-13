$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

. $toolsDir\helpers.ps1
Invoke-UninstallOldClickShare

$url = "https://www.barco.com/services/website/en/TdeFiles/Download?FileNumber=R3306194&TdeType=3&MajorVersion=04&MinorVersion=28&PatchVersion=00&BuildVersion=011&ShowDownloadPage=False"
$checksum = '0845EDD24B7BC25DD0661A1776F47C7CD46CBC9DAFFA7687321E4275DBB6DA0D'

$packageArgsURL = @{
  packageName   = $env:ChocolateyPackageName
  file          = $url
  checksum      = $checksum
  checksumType  = 'sha256'
  unziplocation = $env:TEMP
}
Install-ChocolateyZipPackage @packageArgsURL

$file = Join-Path $env:TEMP 'R3306194_39_ApplicationSw\ClickShare_Installer.msi'
#$file = Join-Path $env:TEMP 'ClickShare_Installer.msi'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  file          = $file
  softwareName  = 'clickshare*'
  silentArgs    = "/qn ACCEPT_EULA=YES"
  validExitCodes= @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgs
