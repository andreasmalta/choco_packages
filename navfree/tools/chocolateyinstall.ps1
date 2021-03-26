$ErrorActionPreference = 'Stop';
$url             = 'https://efulfillment.autodesk.com/NetSWDLD/2022/NAVFREE/087B95DF-F444-3F18-B633-4A7A0A0488A4/SFX/Autodesk_Navisworks_Freedom_2022_Win_64bit_dlm.sfx.exe'
$checksum        = 'F490744780CD2F986AED31643F85818736E3680F71D47681E563C13C5894103A'

$unzip           = Join-Path $env:TEMP 'DWGTrueView_2022_English_64bit_dlm'
$navfree         = Join-Path $unzip 'x64\NAVFREE\freedom.msi'
$navfreelp       = Join-Path $unzip 'x64\en-US\NAVFREE\NAVFREE_LP.msi'
$matlib          = Join-Path $unzip 'Content\ADSKMaterials\CM\MaterialLibrary2022.msi'
$matlibbase      = Join-Path $unzip 'Content\ADSKMaterials\ILB\BaseImageLibrary2022.msi'
$matlibadv       = Join-Path $unzip 'Content\ADSKMaterials\PLB\PrismBaseImageLibrary2022.msi'
$adsso           = Join-Path $unzip 'x64\AdSSO\AdSSO.msi'
$ags             = Join-Path $unzip 'x64\AGS\Autodesk Genuine Service.msi'
$adapp           = Join-Path $unzip 'x86\ADSKAPP\AdApplicationManager-installer.exe'

$navfreekey      = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{C39E6EC4-985A-0000-92D4-F6DC06B39DD2}'
$languagekey     = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{C39E6EC4-985A-0409-92D4-F6DC06B39DD2}'
$uninstallstring = 'MsiExec.exe /I{C39E6EC4-985A-0000-92D4-F6DC06B39DD2}'

$packageArgsUnzip = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = $url
  softwareName   = 'NavFree Unzip'
  checksum       = $checksum
  checksumType   = 'sha256'
  silentArgs     = "-suppresslaunch -d $env:TEMP"
  validExitCodes = @(0, 3010, 1641)
}

$packageArgsNavFree  = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  file           = $navfree
  softwareName   = 'dwgtrueview*'
  silentArgs     = "/qn /norestart"
  validExitCodes = @(0, 3010, 1641)
}

$packageArgsNavFreeLP  = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  file           = $navfreelp
  softwareName   = 'dwgtrueview*'
  silentArgs     = "/qn /norestart"
  validExitCodes = @(0, 3010, 1641)
}
$packageArgsMatLib  = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  file           = $matlib
  softwareName   = 'dwgtrueview*'
  silentArgs     = "/qn /norestart"
  validExitCodes = @(0, 3010, 1641)
}
$packageArgsMatLibBase  = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  file           = $matlibbase
  softwareName   = 'dwgtrueview*'
  silentArgs     = "/qn /norestart"
  validExitCodes = @(0, 3010, 1641)
}
$packageArgsMatLibAdv  = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  file           = $matlibadv
  softwareName   = 'dwgtrueview*'
  silentArgs     = "/qn /norestart"
  validExitCodes = @(0, 3010, 1641)
}
$packageArgsAdSSO  = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  file           = $adsso
  softwareName   = 'dwgtrueview*'
  silentArgs     = "/qn /norestart"
  validExitCodes = @(0, 3010, 1641)
}
$packageArgsAGS  = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  file           = $ags
  softwareName   = 'dwgtrueview*'
  silentArgs     = "/qn /norestart"
  validExitCodes = @(0, 3010, 1641)
}
$packageArgsAdApp = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  file           = $adapp
  softwareName   = 'NavFree Unzip'
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
Install-ChocolateyInstallPackage @packageArgsNavFree
Install-ChocolateyInstallPackage @packageArgsNavFreeLP
Install-ChocolateyInstallPackage @packageArgsMatLib
Install-ChocolateyInstallPackage @packageArgsMatLibBase
Install-ChocolateyInstallPackage @packageArgsMatLibAdv
Install-ChocolateyInstallPackage @packageArgsAdSSO
Install-ChocolateyInstallPackage @packageArgsAGS
Install-ChocolateyInstallPackage @packageArgsAdApp

#msi installers are missing uninstall entry, creating it manually
if (Test-path $navfreekey)
{
Set-Itemproperty -path $navfreekey -Name 'NoRemove' -value '0' -Type dword
Set-Itemproperty -path $navfreekey -Name 'SystemComponent' -value '0' -Type dword
Set-ItemProperty -path $navfreekey -name 'UninstallString' -value $uninstallstring -Type ExpandString
}
if (Test-path $languagekey)
{
Set-Itemproperty -path $languagekey -Name 'SystemComponent' -value '0' -Type dword
}
