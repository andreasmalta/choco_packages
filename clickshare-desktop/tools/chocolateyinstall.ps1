$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# Get download link
$useragent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.2903.86"
$DownloadLink = Invoke-WebRequest "https://www.barco.com/bin/barco/tde/downloadUrl.json?fileNumber=R3306194&tdeType=3" -UserAgent $useragent | ConvertFrom-Json
$url = $DownloadLink.downloadUrl
$checksum = '2B829A9091D6005FCBCEAEA8841FD988A9EECA1D33D30F41E16963E1BAC8DB0F'

# Check Package Parameters
$pp = Get-PackageParameters
if ($pp.'ExtendedDesktop') { $silent = "/qn ACCEPT_EULA=YES EXTENDED_DESKTOP=YES AUTO_UPDATE=NO" }
else { $silent = "/qn ACCEPT_EULA=YES AUTO_UPDATE=NO" }

#Download and Extract
$packageArgsURL = @{
  packageName   = $env:ChocolateyPackageName
  file          = $url
  checksum      = $checksum
  checksumType  = 'sha256'
  unziplocation = $env:TEMP
}
Install-ChocolateyZipPackage @packageArgsURL

#Remove old version
. $toolsDir\helpers.ps1
Invoke-UninstallOldClickShare

#Install
$file = Join-Path $env:TEMP 'ClickShare_Installer.msi'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  file          = $file
  softwareName  = 'clickshare*'
  silentArgs    = $silent
  validExitCodes= @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgs
