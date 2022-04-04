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
	Uninstall-ChocolateyPackage -PackageName "$($_.DisplayName)" -FileType "msi" -SilentArgs "$($silentArgs)" -File '' -ValidExitCodes $validExitCodes
	Remove-Item $_.PsPath -Recurse -ErrorAction Ignore
	}
if (Test-Path $folderRoot) { Get-ChildItem $folderRoot -Recurse -Force -Directory -Include $packageName1 | Remove-Item -Recurse -Confirm:$false -Force }

#UNINSTALL DESKTOP APP
Stop-Process -Name "Autodesk*" -Force
Stop-Service -Name "AdAppMgrSvc"
Remove-Item –path C:\ProgramData\Autodesk\SDS –recurse
Uninstall-ChocolateyPackage -PackageName 'Autodesk Desktop App' -FileType 'exe' -SilentArgs '--mode unattended' -File 'C:\Program Files (x86)\Autodesk\Autodesk Desktop App\removeAdAppMgr.exe'
