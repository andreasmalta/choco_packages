$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

. $toolsDir\helpers.ps1
Invoke-UninstallOldClickShare

$url            = "https://www.barco.com/services/website/en/TdeFiles/Download?FileNumber=R3306194&TdeType=3&MajorVersion=04&MinorVersion=22&PatchVersion=00&BuildVersion=013&ShowDownloadPage=False"
$checksum_url   = '7F44E361AD323660D994AB0A8A156D5241F7D05D12ACD849FB7291755FF0A213'
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
