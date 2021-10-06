$ErrorActionPreference = 'Stop';

$url            = "https://www.barco.com/services/website/en/TdeFiles/Download?FileNumber=R3306194&TdeType=3&MajorVersion=04&MinorVersion=17&PatchVersion=00&BuildVersion=009&ShowDownloadPage=False"
$checksum_url   = 'B6BD235B78F6F83F8BBA09C3E7557B219959EB0F85F3020DBE405E04D479FAA2'
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
