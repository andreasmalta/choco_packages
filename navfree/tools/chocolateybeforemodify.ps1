$ErrorActionPreference = 'Stop';

#Uninstall old version - Main software & English Language Pack 2021
Uninstall-ChocolateyPackage -PackageName "Autodesk Navisworks Freedom 2021" -FileType "msi" -SilentArgs "{DECB3F5F-A3E8-0000-8836-4CDD683D49DB} /qn /norestart"
Uninstall-ChocolateyPackage -PackageName "Autodesk Navisworks Freedom 2021 - English Language Pack" -FileType "msi" -SilentArgs "{DECB3F5F-A3E8-0409-8836-4CDD683D49DB} /qn /norestart"

#Uninstall old version - Material Library
$packageName = 'Autodesk Material Library*'
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
