$ErrorActionPreference = 'Stop';
$url             = 'https://efulfillment.autodesk.com/NetSWDLD/2022/NAVFREE/087B95DF-F444-3F18-B633-4A7A0A0488A4/SFX/Autodesk_Navisworks_Freedom_2022_Win_64bit_dlm.sfx.exe'
$checksum        = 'F490744780CD2F986AED31643F85818736E3680F71D47681E563C13C5894103A'

$unzip           = Join-Path $env:TEMP 'Autodesk_Navisworks_Freedom_2022_Win_64bit_dlm'
$matlib          = Join-Path $unzip 'Content\ADSKMaterials\CM\MaterialLibrary2022.msi'
$matlibbase      = Join-Path $unzip 'Content\ADSKMaterials\ILB\BaseImageLibrary2022.msi'
$matlibadv       = Join-Path $unzip 'Content\ADSKMaterials\PLB\PrismBaseImageLibrary2022.msi'
$adsso           = Join-Path $unzip 'x64\AdSSO\AdSSO.msi'
$navfree         = Join-Path $unzip 'x64\NAVFREE\freedom.msi'
$navfreelp       = Join-Path $unzip 'x64\en-US\NAVFREE\NAVFREE_LP.msi'
$ags             = Join-Path $unzip 'x64\AGS\Autodesk Genuine Service.msi'
$adapp           = Join-Path $unzip 'x86\ADSKAPP\AdApplicationManager-installer.exe'

$navfreekey      = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{C39E6EC4-985A-0000-92D4-F6DC06B39DD2}'
$uninstallstring = 'MsiExec.exe /I{C39E6EC4-985A-0000-92D4-F6DC06B39DD2}'

$packageArgsUnzip = @{
  packageName    = 'NAVFREE Unzip'
  fileType       = 'exe'
  url            = $url
  softwareName   = 'NAVFREE Unzip*'
  checksum       = $checksum
  checksumType   = 'sha256'
  silentArgs     = "-suppresslaunch -d $env:TEMP"
  validExitCodes = @(0, 3010, 1641)
}
$packageArgsMatLib  = @{
  packageName    = 'Autodesk Material Library'
  fileType       = 'msi'
  file           = $matlib
  softwareName   = 'Autodesk Material Library*'
  silentArgs     = "/qn /norestart"
  validExitCodes = @(0, 3010, 1641)
}
$packageArgsMatLibBase  = @{
  packageName    = 'Autodesk Material Library Base Resolution Image Library'
  fileType       = 'msi'
  file           = $matlibbase
  softwareName   = 'Autodesk Material Library Base Resolution Image Library*'
  silentArgs     = "/qn /norestart"
  validExitCodes = @(0, 3010, 1641)
}
$packageArgsMatLibAdv  = @{
  packageName    = 'Autodesk Advanced Material Library Base Resolution Image Library'
  fileType       = 'msi'
  file           = $matlibadv
  softwareName   = 'Autodesk Advanced Material Library Base Resolution Image Library*'
  silentArgs     = "/qn /norestart"
  validExitCodes = @(0, 3010, 1641)
}
$packageArgsAdSSO  = @{
  packageName    = 'Autodesk Single Sign On Component'
  fileType       = 'msi'
  file           = $adsso
  softwareName   = 'Autodesk Single Sign On Component*'
  silentArgs     = "/qn /norestart"
  validExitCodes = @(0, 3010, 1641)
}
$packageArgsNavFree  = @{
  packageName    = 'Autodesk Navisworks Freedom'
  fileType       = 'msi'
  file           = $navfree
  softwareName   = 'Autodesk Navisworks Freedom*'
  silentArgs     = "/qn /norestart"
  validExitCodes = @(0, 3010, 1641)
}
$packageArgsNavFreeLP  = @{
  packageName    = 'Autodesk Navisworks Freedom Language Pack'
  fileType       = 'msi'
  file           = $navfreelp
  softwareName   = 'Autodesk Navisworks Freedom Language Pack*'
  silentArgs     = "/qn /norestart"
  validExitCodes = @(0, 3010, 1641)
}
$packageArgsAGS  = @{
  packageName    = 'Autodesk Genuine Service'
  fileType       = 'msi'
  file           = $ags
  softwareName   = 'Autodesk Genuine Service*'
  silentArgs     = "/qn /norestart"
  validExitCodes = @(0, 3010, 1641)
}
$packageArgsAdApp = @{
  packageName    = 'Autodesk Desktop App'
  fileType       = 'exe'
  file           = $adapp
  softwareName   = 'Autodesk Desktop App*'
  silentArgs     = "--mode unattended"
  validExitCodes = @(0, 3010, 1641)
}

#remove any reboot requests that may block the installation
$RegRebootRequired = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired"
if (Test-path $RegRebootRequired)
{
    Remove-Item -Path $RegRebootRequired
}

#unzip and install (using msi since setup.exe not silent)
Install-ChocolateyPackage @packageArgsUnzip
Install-ChocolateyInstallPackage @packageArgsMatLib
Install-ChocolateyInstallPackage @packageArgsMatLibBase
Install-ChocolateyInstallPackage @packageArgsMatLibAdv
Install-ChocolateyInstallPackage @packageArgsAdSSO
Install-ChocolateyInstallPackage @packageArgsNavFree
Install-ChocolateyInstallPackage @packageArgsNavFreeLP
Install-ChocolateyInstallPackage @packageArgsAGS
Install-ChocolateyInstallPackage @packageArgsAdApp

#msi installers are missing uninstall entry, creating it manually
if (Test-path $navfreekey)
{
Set-Itemproperty -path $navfreekey -Name 'NoRemove' -value '0' -Type dword
Set-Itemproperty -path $navfreekey -Name 'SystemComponent' -value '0' -Type dword
Set-ItemProperty -path $navfreekey -name 'UninstallString' -value $uninstallstring -Type ExpandString
}
