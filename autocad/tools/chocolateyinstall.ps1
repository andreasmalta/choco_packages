$ErrorActionPreference = 'Stop';

$url             = 'https://efulfillment.autodesk.com/NetSWDLD/2022/ACD/1E7D4EF7-A28E-3D3E-BA3C-C6FAE4AAB2E0/SFX/AutoCAD_2022_English_Win_64bit_dlm.sfx.exe'
$checksum        = 'F7C886D879BD311635EBF229B9F5D9B6CE2171C668E905EE83C239FE9BBF2FB9'

$unzip           = Join-Path $env:TEMP 'AutoCAD_2022_English_Win_64bit_dlm'
$packageArgsURL  = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = $url
  softwareName   = 'autocad*'
  checksum       = $checksum
  checksumType   = 'sha256'
  silentArgs     = "-suppresslaunch -d $env:TEMP"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgsURL

#remove any reboot requests that may block the installation
$RegRebootRequired = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired"
if (Test-path $RegRebootRequired)
{
    Remove-Item -Path $RegRebootRequired
}

#setup.exe is apparently not silent so we have to install all parts individually below
$adsso           = Join-Path $unzip 'x64\AdSSO\AdSSO.msi'
$packageArgsAdSSO  = @{
  packageName    = 'Autodesk Single Sign On Component'
  fileType       = 'msi'
  file           = $adsso
  softwareName   = 'Autodesk Single Sign On Component*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgsAdSSO

$cm              = Join-Path $unzip 'Content\ADSKMaterials\CM\MaterialLibrary2022.msi'
$packageArgsCM   = @{
  packageName    = 'Autodesk Material Library 2022'
  fileType       = 'msi'
  file           = $cm
  softwareName   = 'Autodesk Material Library 2022*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgsCM

$ilb             = Join-Path $unzip 'Content\ADSKMaterials\ILB\BaseImageLibrary2022.msi'
$packageArgsILB  = @{
  packageName    = 'Autodesk Material Library Base Resolution Image Library 2022'
  fileType       = 'msi'
  file           = $ilb
  softwareName   = 'Autodesk Material Library Base Resolution Image Library 2022*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgsILB

$adsklic         = Join-Path $unzip 'x86\Licensing\AdskLicensing-installer.exe'
$packageArgsLic  = @{
  packageName    = 'Autodesk Licensing Installer'
  fileType       = 'exe'
  file           = $adsklic
  softwareName   = 'Autodesk Licensing Installer*'
  silentArgs     = '--mode unattended'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgsLic

$acad            = Join-Path $unzip 'x64\acad\acad.msi'
$packageArgsACAD = @{
  packageName    = 'AutoCAD 2022'
  fileType       = 'msi'
  file           = $acad
  softwareName   = 'AutoCAD 2022*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgsACAD

$acadprivate     = Join-Path $unzip 'x64\acadprivate\acadprivate.msi'
$packageArgsPrivate  = @{
  packageName    = 'ACAD Private'
  fileType       = 'msi'
  file           = $acadprivate
  softwareName   = 'ACAD Private*'
  silentArgs     = 'ADSK_ODIS_SETUP="1" /qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgsPrivate

$acadlp          = Join-Path $unzip 'x64\en-US\acadlp\acadlp.msi'
$packageArgsLP  = @{
  packageName    = 'AutoCAD 2022 Language Pack - English'
  fileType       = 'msi'
  file           = $acadlp
  softwareName   = 'AutoCAD 2022 Language Pack - English*'
  silentArgs     = 'ADSK_ODIS_SETUP="1" /qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgsLP

$acadps          = Join-Path $unzip 'x64\en-US\acadps\acadps.msi'
$packageArgsPS  = @{
  packageName    = 'AutoCAD 2022 - English Product Specific Pack'
  fileType       = 'msi'
  file           = $acadps
  softwareName   = 'AutoCAD 2022 - English Product Specific Pack*'
  silentArgs     = 'ADSK_ODIS_SETUP="1" /qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgsPS

$acaoe           = Join-Path $unzip 'x64\acaoe\acaoe.msi'
$packageArgsACAOE  = @{
  packageName    = 'ACA & MEP 2022 Object Enabler'
  fileType       = 'msi'
  file           = $acaoe
  softwareName   = 'ACA & MEP 2022 Object Enabler*'
  silentArgs     = 'ADSK_ODIS_SETUP="1" /qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgsACAOE

$savetoweb       = Join-Path $unzip 'x64\savetowebandmobile\autodesksavetowebandmobile.msi'
$packageArgsS2Web  = @{
  packageName    = 'Autodesk Save to Web and Mobile'
  fileType       = 'msi'
  file           = $savetoweb
  softwareName   = 'Autodesk Save to Web and Mobile*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgsS2Web

$ags             = Join-Path $unzip 'x64\AGS\Autodesk Genuine Service.msi'
$packageArgsAGS  = @{
  packageName    = 'Autodesk Genuine Service'
  fileType       = 'msi'
  file           = $ags
  softwareName   = 'Autodesk Genuine Service*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgsAGS

$adskapp         = Join-Path $unzip 'x86\ADSKAPP\AdApplicationManager-installer.exe'
$packageArgsADSKAPP = @{
  packageName    = 'Autodesk Desktop app'
  fileType       = 'exe'
  file           = $adskapp
  softwareName   = 'Autodesk Desktop app*'
  silentArgs     = '--mode unattended'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgsADSKAPP

$appmanager      = Join-Path $unzip 'x64\appmanager\autodeskappmanager.msi'
$packageArgsAppMan  = @{
  packageName    = 'Autodesk App Manager'
  fileType       = 'msi'
  file           = $appmanager
  softwareName   = 'Autodesk App Manager*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgsAppMan

$featuredapps    = Join-Path $unzip 'x64\featuredapps\autodeskfeaturedapps.msi'
$packageArgsFeat  = @{
  packageName    = 'Autodesk Featured Apps'
  fileType       = 'msi'
  file           = $featuredapps
  softwareName   = 'Autodesk Featured Apps*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgsFeat

$webfileopen     = Join-Path $unzip 'x64\webfileopen\webfileopen.msi'
$packageArgsWebFile  = @{
  packageName    = 'AutoCAD Open in Desktop'
  fileType       = 'msi'
  file           = $webfileopen
  softwareName   = 'AutoCAD Open in Desktop*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgsWebFile
