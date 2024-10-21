$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# Get download link
$DownloadLink = Invoke-WebRequest "https://www.barco.com/bin/barco/tde/downloadUrl.json?fileNumber=R3306194&tdeType=3" | ConvertFrom-Json
$url = $DownloadLink.downloadUrl
$checksum = '9D964FFE088C29FDEFE645E1EF3A02C7AC3E594962750263ABA10826AA689766'

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
