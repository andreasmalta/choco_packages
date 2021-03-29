$ErrorActionPreference = 'Stop';

#$url            = 'https://efulfillment.autodesk.com/NetSWDLD/2022/ACD/1E7D4EF7-A28E-3D3E-BA3C-C6FAE4AAB2E0/SFX/AutoCAD_2022_English_Win_64bit_dlm.sfx.exe'
$url            = 'Z:\autocad\AutoCAD_2022_English_Win_64bit_dlm.sfx.exe'
$checksum       = 'F7C886D879BD311635EBF229B9F5D9B6CE2171C668E905EE83C239FE9BBF2FB9'

$packageArgsURL = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = $url
  softwareName  = 'autocad*'
  checksum      = $checksum
  checksumType  = 'sha256'
  silentArgs    = "-suppresslaunch -d $env:TEMP"
  validExitCodes= @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgsURL


Autodesk Single Sign On Component
msiexec /i "C:\Autodesk\AutoCAD_2022_English_Win_64bit_dlm\x64\AdSSO\AdSSO.msi" /qn /norestart

Autodesk Material Library 2022
msiexec /i "C:\Autodesk\AutoCAD_2022_English_Win_64bit_dlm\Content\ADSKMaterials\CM\MaterialLibrary2022.msi" /qn /norestart

Autodesk Material Library Base Resolution Image Library 2022
msiexec /i "C:\Autodesk\AutoCAD_2022_English_Win_64bit_dlm\Content\ADSKMaterials\ILB\BaseImageLibrary2022.msi" /qn /norestart

Autodesk Licensing Installer 1.0
"C:\Autodesk\AutoCAD_2022_English_Win_64bit_dlm\x86\Licensing\AdskLicensing-installer.exe" --mode unattended

AutoCAD 2022
msiexec /i "C:\Autodesk\AutoCAD_2022_English_Win_64bit_dlm\x64\acad\acad.msi" /qn /norestart

ACAD Private
msiexec /i "C:\Autodesk\AutoCAD_2022_English_Win_64bit_dlm\x64\acadprivate\acadprivate.msi" ADSK_ODIS_SETUP="1" /qn /norestart

AutoCAD 2022 Language Pack - English
msiexec /i "C:\Autodesk\AutoCAD_2022_English_Win_64bit_dlm\x64\en-US\acadlp\acadlp.msi" ADSK_ODIS_SETUP="1" /qn /norestart

AutoCAD 2022 - English (Product Specific Pack)
msiexec /i "C:\Autodesk\AutoCAD_2022_English_Win_64bit_dlm\x64\en-US\acadps\acadps.msi" ADSK_ODIS_SETUP="1" /qn /norestart

ACA & MEP 2022 Object Enabler
msiexec /i "C:\Autodesk\AutoCAD_2022_English_Win_64bit_dlm\x64\acaoe\acaoe.msi" ADSK_ODIS_SETUP="1" /qn /norestart

Autodesk Save to Web and Mobile
msiexec /i "C:\Autodesk\AutoCAD_2022_English_Win_64bit_dlm\x64\savetowebandmobile\autodesksavetowebandmobile.msi" /qn /norestart

Autodesk Genuine Service
msiexec /i "C:\Autodesk\AutoCAD_2022_English_Win_64bit_dlm\x64\AGS\Autodesk Genuine Service.msi" /qn /norestart

Autodesk Desktop app
"C:\Autodesk\AutoCAD_2022_English_Win_64bit_dlm\x86\ADSKAPP\AdApplicationManager-installer.exe" --mode unattended

Autodesk App Manager
msiexec /i "C:\Autodesk\AutoCAD_2022_English_Win_64bit_dlm\x64\appmanager\autodeskappmanager.msi" /qn /norestart

Autodesk Featured Apps
msiexec /i "C:\Autodesk\AutoCAD_2022_English_Win_64bit_dlm\x64\featuredapps\autodeskfeaturedapps.msi" /qn /norestart

AutoCAD Open in Desktop
msiexec /i "C:\Autodesk\AutoCAD_2022_English_Win_64bit_dlm\x64\webfileopen\webfileopen.msi" /qn /norestart
