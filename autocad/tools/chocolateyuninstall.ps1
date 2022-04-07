$ErrorActionPreference = 'Stop';

Stop-Process -Name "Autodesk*" -Force
Stop-Service -Name "AdAppMgrSvc"
Remove-Item –path C:\ProgramData\Autodesk\SDS –recurse
Uninstall-ChocolateyPackage -PackageName 'Autodesk Desktop App' -FileType 'exe' -SilentArgs '--mode unattended' -File 'C:\Program Files (x86)\Autodesk\Autodesk Desktop App\removeAdAppMgr.exe'

$packageName = '*AutoCAD*'
$packageName2 = '*Material Library*'
$packageName3 = 'Autodesk Single*'
$packageName4 = 'Autodesk Save*'
$folderRoot = 'C:\Program Files\Autodesk'
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
if (Test-Path $folderRoot) { Get-ChildItem $folderRoot -Recurse -Force -Directory -Include $packageName | Remove-Item -Recurse -Confirm:$false -Force }

$packageName = 'Autodesk Genuine*'
$validExitCodes = @(0, 3010, 1603, 1605, 1614, 1641)
Get-ItemProperty -Path @('HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
                         'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*') `
                 -ErrorAction:SilentlyContinue `
| Where-Object   {$_.DisplayName -like $packageName} `
| ForEach-Object {
	$silentArgs = "$($_.PSChildName) /qn /norestart"
	if($($_.PSChildName) -like '{*') { Uninstall-ChocolateyPackage -PackageName "$($_.DisplayName)" -FileType "msi" -SilentArgs "$($silentArgs)" -File '' -ValidExitCodes $validExitCodes }
	Remove-Item $_.PsPath -Recurse -ErrorAction Ignore
	}
