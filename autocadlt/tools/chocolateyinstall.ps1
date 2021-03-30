$ErrorActionPreference = 'Stop';

#$url             = 'https://efulfillment.autodesk.com/NetSWDLD/2022/ACDLT/3E4FF57B-0533-3C99-A29F-C9E2838E11E5/SFX/AutoCAD_LT_2022_English_Win_64bit_dlm.sfx.exe'
$url             = 'Z:\autocadlt\AutoCAD_LT_2022_English_Win_64bit_dlm.sfx.exe'
$checksum        = '34D6D25E0A981BDABCC6B1C1725610DFC0419E82A1FAD62F983FE9A9DE702972'

$unzip           = Join-Path $env:TEMP 'AutoCAD_LT_2022_English_Win_64bit_dlm'
$packageArgsURL  = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = $url
  softwareName   = 'autocadlt*'
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

$acadlt            = Join-Path $unzip 'x64\acadlt\acadlt.msi'
$packageArgsACADLT = @{
  packageName    = 'AutoCAD LT 2022 - English'
  fileType       = 'msi'
  file           = $acadlt
  softwareName   = 'AutoCAD LT 2022 - English*'
  silentArgs     = 'ADSK_ODIS_SETUP="1" /qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgsACADLT

$acadltlp          = Join-Path $unzip 'x64\en-US\acadltlp\acadltlp.msi'
$packageArgsLTLP  = @{
  packageName    = 'AutoCAD LT 2022 Language Pack - English'
  fileType       = 'msi'
  file           = $acadltlp
  softwareName   = 'AutoCAD LT 2022 Language Pack - English*'
  silentArgs     = 'ADSK_ODIS_SETUP="1" /qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgsLTLP

$acadltps          = Join-Path $unzip 'x64\en-US\acadltps\acadltps.msi'
$packageArgsLTPS  = @{
  packageName    = 'AutoCAD LT 2022 - English Product Specific Pack'
  fileType       = 'msi'
  file           = $acadltps
  softwareName   = 'AutoCAD LT 2022 - English Product Specific Pack*'
  silentArgs     = 'ADSK_ODIS_SETUP="1" /qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgsLTPS

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
