$ErrorActionPreference = 'Stop';

#UNINSTALL OLD VERSIONS
$packageName1 = '*Navisworks Freedom*'
$packageName2 = '*Material Library*'
$folderRoot = 'C:\Program Files\Autodesk'
$validExitCodes = @(0, 3010, 1603, 1605, 1614, 1641)
Get-ItemProperty -Path @('HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
                         'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*') `
                 -ErrorAction:SilentlyContinue `
| Where-Object   {$_.DisplayName -like $packageName1 -or $_.DisplayName -like $packageName2} `
| ForEach-Object {
	$silentArgs = "$($_.PSChildName) /qn /norestart"
	if($($_.PSChildName) -like '{*') { Uninstall-ChocolateyPackage -PackageName "$($_.DisplayName)" -FileType "msi" -SilentArgs "$($silentArgs)" -File '' -ValidExitCodes $validExitCodes }
	Remove-Item $_.PsPath -Recurse -ErrorAction Ignore
	}
if (Test-Path $folderRoot) { Get-ChildItem $folderRoot -Recurse -Force -Directory -Include $packageName1 | Remove-Item -Recurse -Confirm:$false -Force }

#REMOVE REBOOT REQUESTS
$RegRebootRequired = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired"
if (Test-path $RegRebootRequired) { Remove-Item -Path $RegRebootRequired }

#EXTRACT AND INSTALL
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2023/NAVFREE/404ED079-9FE3-3739-BA09-0069D1EDDFB6/SFX/Autodesk_Navisworks_Freedom_2023_Win_64bit_dlm.sfx.exe'
$checksum = '0E90A246692A8D6B71D395E831BFFA856831B5CC2857ABE8B0B972D477010D20'
$unzip           = Join-Path $env:TEMP 'Autodesk_Navisworks_Freedom_2023_Win_64bit_dlm'
$packageArgsUnzip = @{
  packageName    = 'NAVFREE Installation Files'
  fileType       = 'exe'
  url            = $url
  softwareName   = 'NAVFREE Installation Files*'
  checksum       = $checksum
  checksumType   = 'sha256'
  silentArgs     = "-suppresslaunch -d $env:TEMP"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgsUnzip

$matlib          = Join-Path $unzip 'Content\ADSKMaterials\CM\MaterialLibrary2023.msi'
$packageArgsMatLib  = @{
  packageName    = 'Autodesk Material Library'
  fileType       = 'msi'
  file           = $matlib
  softwareName   = 'Autodesk Material Library*'
  silentArgs     = "/qn /norestart"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgsMatLib

$matlibbase      = Join-Path $unzip 'Content\ADSKMaterials\ILB\BaseImageLibrary2023.msi'
$packageArgsMatLibBase  = @{
  packageName    = 'Autodesk Material Library Base Resolution Image Library'
  fileType       = 'msi'
  file           = $matlibbase
  softwareName   = 'Autodesk Material Library Base Resolution Image Library*'
  silentArgs     = "/qn /norestart"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgsMatLibBase

$matlibadv       = Join-Path $unzip 'Content\ADSKMaterials\PLB\PrismBaseImageLibrary2023.msi'
$packageArgsMatLibAdv  = @{
  packageName    = 'Autodesk Advanced Material Library Base Resolution Image Library'
  fileType       = 'msi'
  file           = $matlibadv
  softwareName   = 'Autodesk Advanced Material Library Base Resolution Image Library*'
  silentArgs     = "/qn /norestart"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgsMatLibAdv

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

$navfree         = Join-Path $unzip 'x64\NAVFREE\freedom.msi'
$packageArgsNavFree  = @{
  packageName    = 'Autodesk Navisworks Freedom'
  fileType       = 'msi'
  file           = $navfree
  softwareName   = 'Autodesk Navisworks Freedom*'
  silentArgs     = "/qn /norestart"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgsNavFree

$pp = Get-PackageParameters
if ($pp.'BR') { $navfreelp = Join-Path $unzip 'x64\pt-BR\NAVFREE\NAVFREE_LP.msi' }
elseif ($pp.'CN') { $navfreelp = Join-Path $unzip 'x64\zh-CN\NAVFREE\NAVFREE_LP.msi' }
elseif ($pp.'DE') { $navfreelp = Join-Path $unzip 'x64\de-DE\NAVFREE\NAVFREE_LP.msi' }
elseif ($pp.'ES') { $navfreelp = Join-Path $unzip 'x64\es-ES\NAVFREE\NAVFREE_LP.msi' }
elseif ($pp.'FR') { $navfreelp = Join-Path $unzip 'x64\fr-FR\NAVFREE\NAVFREE_LP.msi' }
elseif ($pp.'IT') { $navfreelp = Join-Path $unzip 'x64\it-IT\NAVFREE\NAVFREE_LP.msi' }
elseif ($pp.'JP') { $navfreelp = Join-Path $unzip 'x64\ja-JP\NAVFREE\NAVFREE_LP.msi' }
elseif ($pp.'KR') { $navfreelp = Join-Path $unzip 'x64\ko-KR\NAVFREE\NAVFREE_LP.msi' }
elseif ($pp.'RU') { $navfreelp = Join-Path $unzip 'x64\ru-RU\NAVFREE\NAVFREE_LP.msi' }
elseif ($pp.'TW') { $navfreelp = Join-Path $unzip 'x64\zh-TW\NAVFREE\NAVFREE_LP.msi' }
else { $navfreelp = Join-Path $unzip 'x64\en-US\NAVFREE\NAVFREE_LP.msi' }
$packageArgsNavFreeLP  = @{
  packageName    = 'Autodesk Navisworks Freedom Language Pack'
  fileType       = 'msi'
  file           = $navfreelp
  softwareName   = 'Autodesk Navisworks Freedom Language Pack*'
  silentArgs     = "/qn /norestart"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgsNavFreeLP

$ags = Join-Path $unzip 'x64\AGS\Autodesk Genuine Service.msi'
$packageArgsAGS  = @{
  packageName    = 'Autodesk Genuine Service'
  fileType       = 'msi'
  file           = $ags
  softwareName   = 'Autodesk Genuine Service*'
  silentArgs     = "/qn /norestart"
  validExitCodes = @(0, 3010, 1641)
}
$agsinstalled = (Get-ItemProperty -Path @('HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
                         'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*') -ErrorAction:SilentlyContinue | Where-Object {$_.DisplayName -like 'Autodesk Genuine Service'})
if ($agsinstalled.displayName -match 'Autodesk Genuine Service') {
Write-Host 'Autodesk Genuine Service already installed, skipping installation.'
}else {
Install-ChocolateyInstallPackage @packageArgsAGS
}

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

#CREATING MSI UNINSTALLER
$packageName = 'Autodesk Navisworks Freedom 2023'
Get-ItemProperty -Path @('HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
                         'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*') `
                 -ErrorAction:SilentlyContinue `
| Where-Object   {$_.DisplayName -like $packageName} `
| ForEach-Object {
    Set-Itemproperty -path $_.PsPath -Name 'NoRemove' -value '0' -Type dword
	Set-Itemproperty -path $_.PsPath -Name 'SystemComponent' -value '0' -Type dword
	Set-ItemProperty -path $_.PsPath -name 'UninstallString' -value "MsiExec.exe /I$($_.PSChildName)" -Type ExpandString
	}
