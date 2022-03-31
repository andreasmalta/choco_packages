$ErrorActionPreference = 'Stop';

#Uninstall old Autodesk Navisworks Freedom before upgrade
Uninstall-ChocolateyPackage -PackageName "Autodesk Navisworks Freedom 2022" -FileType "msi" -SilentArgs "{C39E6EC4-985A-0000-92D4-F6DC06B39DD2} /qn /norestart"
Remove-Item 'C:\Program Files\Autodesk\Navisworks Freedom 2022' -Recurse -Force -ErrorAction Ignore
Get-ChildItem -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\ | where { $_.Name -match 'C39E6EC4-985A'} | Remove-Item -Recurse

Uninstall-ChocolateyPackage -PackageName "Autodesk Navisworks Freedom 2023" -FileType "msi" -SilentArgs "{2B7952CB-B38D-0000-B451-89598C224C21} /qn /norestart"
Remove-Item 'C:\Program Files\Autodesk\Navisworks Freedom 2023' -Recurse -Force -ErrorAction Ignore
Get-ChildItem -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\ | where { $_.Name -match '2B7952CB-B38D'} | Remove-Item -Recurse

#Uninstall Material Libraries before upgrade
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
