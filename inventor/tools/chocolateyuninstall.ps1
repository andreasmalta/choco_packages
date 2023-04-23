$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#UNINSTALL MAIN SOFTWARE
. $toolsDir\helpers.ps1
Invoke-UninstallOld

#Uninstall some packages
$packageName = 'Autodesk Interoperability*'
$packageName2 = 'REX Inventor*'
$packageName3 = 'REX Framework*'
$packageName4 = 'RSA Engine*'
$validExitCodes = @(0, 3010, 1603, 1605, 1614, 1641)
Get-ItemProperty -Path @('HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
                         'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*') `
                 -ErrorAction:SilentlyContinue `
| Where-Object   {$_.DisplayName -like $packageName -or $_.DisplayName -like $packageName2 -or $_.DisplayName -like $packageName3 -or $_.DisplayName -like $packageName4} `
| ForEach-Object {
	$silentArgs = "$($_.PSChildName) /qn /norestart"
	if($($_.PSChildName) -like '{*') { Uninstall-ChocolateyPackage -PackageName "$($_.DisplayName)" -FileType "msi" -SilentArgs "$($silentArgs)" -File '' -ValidExitCodes $validExitCodes }
	Remove-Item $_.PsPath -Recurse -ErrorAction Ignore
	}

#Remove DWG TrueView
$packageName = '*DWG TrueView*'
$folderRoot = 'C:\Program Files\Autodesk'
$startmenu = 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs'
Get-ItemProperty -Path @('HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
                         'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*') `
                 -ErrorAction:SilentlyContinue `
| Where-Object   {$_.DisplayName -like $packageName} `
| ForEach-Object {
	$silentArgs = "$($_.PSChildName) /qn /norestart"
	if($($_.PSChildName) -like '{*') { Uninstall-ChocolateyPackage -PackageName "$($_.DisplayName)" -FileType "msi" -SilentArgs "$($silentArgs)" -File '' -ValidExitCodes $validExitCodes }
	Remove-Item $_.PsPath -Recurse -ErrorAction Ignore
	}
Get-ChildItem $folderRoot -Recurse -Force -Directory -ErrorAction SilentlyContinue -Include $packageName | Remove-Item -Recurse -Confirm:$false -Force
Get-ChildItem $startmenu -Recurse -Force -Include $packageName -ErrorAction SilentlyContinue | Remove-Item -Recurse -Confirm:$false -Force

#Remove Autodesk Installer
Get-Process "AdskAccessCore*" -ErrorAction SilentlyContinue | Stop-Process -Force
$AdODIS = 'C:\Program Files\Autodesk\AdODIS\V1\RemoveODIS.exe'
if (Test-Path $AdODIS) { Uninstall-ChocolateyPackage -PackageName 'Autodesk Installer' -FileType 'exe' -SilentArgs '--mode unattended' -File $AdODIS }

#Remove Autodesk Licensing
$AdskLicensing = 'C:\Program Files (x86)\Common Files\Autodesk Shared\AdskLicensing\uninstall.exe'
if (Test-Path $AdskLicensing) { Uninstall-ChocolateyPackage -PackageName 'Autodesk Licensing' -FileType 'exe' -SilentArgs '--mode unattended' -File $AdskLicensing }

#Remove Autodesk Identity Manager
$AdskIdentityManager = 'C:\Program Files\Autodesk\AdskIdentityManager\uninstall.exe'
if (Test-Path $AdskIdentityManager) { Uninstall-ChocolateyPackage -PackageName 'Autodesk Identity Manager' -FileType 'exe' -SilentArgs '--mode unattended' -File $AdskIdentityManager }

#Remove Autodesk Genuine Service
$packageName = 'Autodesk Genuine*'
Get-ItemProperty -Path @('HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
                         'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*') `
                 -ErrorAction:SilentlyContinue `
| Where-Object   {$_.DisplayName -like $packageName} `
| ForEach-Object {
	$silentArgs = "$($_.PSChildName) /qn /norestart"
	if($($_.PSChildName) -like '{*') { Uninstall-ChocolateyPackage -PackageName "$($_.DisplayName)" -FileType "msi" -SilentArgs "$($silentArgs)" -File '' -ValidExitCodes $validExitCodes }
	Remove-Item $_.PsPath -Recurse -ErrorAction Ignore
	}
