$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#UNINSTALL MAIN SOFTWARE
. $toolsDir\helpers.ps1
Invoke-UninstallOld

#Remove Autodesk Identity Manager
$AdskIdentityManager = 'C:\Program Files\Autodesk\AdskIdentityManager\uninstall.exe'
if (Test-Path $AdskIdentityManager) { Uninstall-ChocolateyPackage -PackageName 'Autodesk Identity Manager' -FileType 'exe' -SilentArgs '--mode unattended' -File $uninstall }

#Remove Autodesk Installer
Get-Process "AdskAccessCore*" -ErrorAction SilentlyContinue | Stop-Process -Force
$AdODIS = 'C:\Program Files\Autodesk\AdODIS\V1\RemoveODIS.exe'
if (Test-Path $AdODIS) { Uninstall-ChocolateyPackage -PackageName 'Autodesk Installer' -FileType 'exe' -SilentArgs '--mode unattended' -File $AdODIS }

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
