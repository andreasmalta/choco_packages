$ErrorActionPreference = 'Stop';

#Uninstall old version - Autodesk Navisworks Freedom & Language Packs
Uninstall-ChocolateyPackage -PackageName "Autodesk Navisworks Freedom" -FileType "msi" -SilentArgs "{C39E6EC4-985A-0000-92D4-F6DC06B39DD2} /qn /norestart"
Remove-Item 'C:\Program Files\Autodesk\Navisworks Freedom 2022' -Recurse -Force -ErrorAction Ignore
Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{C39E6EC4-985A-0409-92D4-F6DC06B39DD2}" -Recurse

#Uninstall old version - Material Library
$packageName = '*Material Library*'
$validExitCodes = @(0, 3010, 1605, 1614, 1641)
Get-ItemProperty -Path @('HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
                         'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*') `
                 -ErrorAction:SilentlyContinue `
| Where-Object   {$_.DisplayName -like $packageName} `
| ForEach-Object {
	$silentArgs = '/qn /norestart'
	$file = "$($_.UninstallString)"
	$silentArgs = "$($_.PSChildName) $silentArgs"
	$file = ''
	Uninstall-ChocolateyPackage -PackageName "$packageName" -FileType "msi" -SilentArgs "$($silentArgs)" -File "$file" -ValidExitCodes $validExitCodes
	}
