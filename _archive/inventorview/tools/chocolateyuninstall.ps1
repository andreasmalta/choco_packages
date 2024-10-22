$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#UNINSTALL MAIN SOFTWARE
. $toolsDir\helpers.ps1
Invoke-UninstallOld

Stop-Process -Name "Autodesk*" -Force
Stop-Service -Name "AdAppMgrSvc"
Remove-Item –path C:\ProgramData\Autodesk\SDS –recurse
Uninstall-ChocolateyPackage -PackageName 'Autodesk Desktop App' -FileType 'exe' -SilentArgs '--mode unattended' -File 'C:\Program Files (x86)\Autodesk\Autodesk Desktop App\removeAdAppMgr.exe'

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
