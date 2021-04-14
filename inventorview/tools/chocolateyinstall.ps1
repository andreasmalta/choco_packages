$ErrorActionPreference = 'Stop';

$url             = 'https://download.autodesk.com/us/support/files/autodesk_inventor_view_2022/inventor_view_2022_english_win_64bit_dlm.sfx.exe'
$checksum        = '94C4E11509DEA6F7857B936920E627D27160EE2EA148B72CFCF1B48477B6C94B'
$unzip           = Join-Path $env:TEMP 'Inventor_View_2022_English_Win_64bit_DLM'

$regkey2022      = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{7F4DD591-2664-0004-0000-7107D70F3DB4}'
$regkey2022lp    = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{7F4DD591-2664-0004-1033-7107D70F3DB4}'

#Uninstall old versions first
$packagename     = 'Inventor View 2021'
$productcode     = '{7F4DD591-2564-0004-0000-7107D70F3DB4}'
$regkey          = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$productcode"
if (Test-path $regkey) { Uninstall-ChocolateyPackage -PackageName "$packagename" -FileType "msi" -SilentArgs "$productcode /qn /norestart" }

$packagename     = 'Language Pack 2021'
$productcode     = '{7F4DD591-2564-0004-1033-7107D70F3DB4}'
$regkey          = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$productcode"
if (Test-path $regkey) { Uninstall-ChocolateyPackage -PackageName "$packagename" -FileType "msi" -SilentArgs "$productcode /qn /norestart" }

#Extract first
$packageArgsUnzip = @{
  packageName    = 'Unzip'
  fileType       = 'exe'
  url            = $url
  softwareName   = 'Unzip*'
  checksum       = $checksum
  checksumType   = 'sha256'
  silentArgs     = "-suppresslaunch -d $env:TEMP"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgsUnzip

#Remove any reboot requests that may block the installation
$RegRebootRequired = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired"
if (Test-path $RegRebootRequired) { Remove-Item -Path $RegRebootRequired }

#Setup.exe not silent, installing all modules one by one
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
if (Test-path $regkey2022) { Set-Itemproperty -path $regkey2022 -Name 'SystemComponent' -value '0' -Type dword }

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
if (Test-path $regkey2022lp) { Set-Itemproperty -path $regkey2022lp -Name 'SystemComponent' -value '0' -Type dword }

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
