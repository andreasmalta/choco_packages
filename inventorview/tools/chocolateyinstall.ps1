$ErrorActionPreference = 'Stop';

$url             = "Z:\inventorview\inventor_view_2022_english_win_64bit_dlm.sfx.exe"
#$url             = 'https://download.autodesk.com/us/support/files/autodesk_inventor_view_2022/inventor_view_2022_english_win_64bit_dlm.sfx.exe'
$checksum        = '94C4E11509DEA6F7857B936920E627D27160EE2EA148B72CFCF1B48477B6C94B'
$unzip           = Join-Path $env:TEMP 'Inventor_View_2022_English_Win_64bit_DLM'
$regkey          = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{7F4DD591-2664-0004-0000-7107D70F3DB4}'
$regkeylp        = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{7F4DD591-2664-0004-1033-7107D70F3DB4}'

$packageArgsUnzip = @{
  packageName    = 'IVV Unzip'
  fileType       = 'exe'
  url            = $url
  softwareName   = 'IVV Unzip*'
  checksum       = $checksum
  checksumType   = 'sha256'
  silentArgs     = "-suppresslaunch -d $env:TEMP"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgsUnzip

#remove any reboot requests that may block the installation
$RegRebootRequired = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired"
if (Test-path $RegRebootRequired)
{
    Remove-Item -Path $RegRebootRequired
}

$adsso           = Join-Path $unzip 'x64\AdSSO\AdSSO.msi'
$packageArgsAdSSO  = @{
  packageName    = 'Autodesk Single Sign On Component'
  fileType       = 'msi'
  file           = $adsso
  softwareName   = 'Autodesk Single Sign On Component*'
  silentArgs     = "/qn /norestart"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgsAdSSO

$ivv             = Join-Path $unzip 'x64\IVV\InventorView.msi'
$packageArgsIVV  = @{
  packageName    = 'Inventor View'
  fileType       = 'msi'
  file           = $ivv
  softwareName   = 'Inventor View*'
  silentArgs     = 'ADSK_ODIS_SETUP="1" /qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgsIVV

$ivvlp           = Join-Path $unzip 'x64\en-US\IVV\inventorViewLP.msi'
$packageArgsIVVLP  = @{
  packageName    = 'Inventor View Language Pack'
  fileType       = 'msi'
  file           = $ivvlp
  softwareName   = 'Inventor View Language Pack*'
  silentArgs     = 'ADSK_ODIS_SETUP="1" /qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgsIVVLP

$adapp           = Join-Path $unzip 'x86\ADSKAPP\AdApplicationManager-installer.exe'
$packageArgsAdApp = @{
  packageName    = 'Autodesk Desktop App'
  fileType       = 'exe'
  file           = $adapp
  softwareName   = 'Autodesk Desktop App*'
  silentArgs     = "--mode unattended"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgsAdApp

#msi installers are missing uninstall entry, creating it manually
if (Test-path $regkey)
{
Set-Itemproperty -path $regkey -Name 'SystemComponent' -value '0' -Type dword
Set-Itemproperty -path $regkeylp -Name 'SystemComponent' -value '0' -Type dword
}
