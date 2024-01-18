$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

. $toolsDir\helpers.ps1
Invoke-UninstallOldClickShare

# Get download link for the latest version
$DownloadLink = Invoke-WebRequest "https://www.barco.com/bin/barco/tde/downloadUrl.json?fileNumber=R3306194&tdeType=3" | ConvertFrom-Json

$url = $DownloadLink.downloadUrl
$checksum = '8CF94B3F2D4326CA69CA8C564BDFF67FBA39E195F5BB36E17DB8D42287FEFAE6'

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
  silentArgs    = "/qn ACCEPT_EULA=YES"
  validExitCodes= @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgs
