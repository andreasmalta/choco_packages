$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# Get download link
$DownloadLink = Invoke-WebRequest "https://www.barco.com/bin/barco/tde/downloadUrl.json?fileNumber=R3306194&tdeType=3" | ConvertFrom-Json
$url = $DownloadLink.downloadUrl
$checksum = '89249CB3283CE2FA97C755573BF8A6169A70A45F0A3F97ACDA4B9977EAB49804'

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
