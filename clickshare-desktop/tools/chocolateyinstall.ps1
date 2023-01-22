$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

. $toolsDir\helpers.ps1
Invoke-UninstallOldClickShare

$url = "https://www.barco.com/services/website/en/TdeFiles/Download?FileNumber=R3306194&TdeType=3&MajorVersion=04&MinorVersion=27&PatchVersion=02&BuildVersion=004&ShowDownloadPage=False"
$checksum = 'EB813966621A14BA1A1157C568B00D21DF3CF11ADA06D95A3962E62BD99555F3'

$packageArgsURL = @{
  packageName   = $env:ChocolateyPackageName
  file          = $url
  checksum      = $checksum
  checksumType  = 'sha256'
  unziplocation = $env:TEMP
}
Install-ChocolateyZipPackage @packageArgsURL

$file = Join-Path $env:TEMP 'ClickShare_Installer.msi'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  file          = $file
  softwareName  = 'clickshare*'
  silentArgs    = "/qn ACCEPT_EULA=YES /norestart"
  validExitCodes= @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgs
