$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$file_Zip = Join-Path $toolsDir 'R3306194_57_ApplicationSw.zip'

#Unzip
$packageArgsURL = @{
  packageName   = $env:ChocolateyPackageName
  file          = $file_Zip
  unziplocation = $env:TEMP
}
Get-ChocolateyUnzip @packageArgsURL

# Check Package Parameters
$pp = Get-PackageParameters
if ($pp.'ExtendedDesktop') { $silent = "/qn ACCEPT_EULA=YES EXTENDED_DESKTOP=YES AUTO_UPDATE=NO" }
else { $silent = "/qn ACCEPT_EULA=YES AUTO_UPDATE=NO" }

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
