$ErrorActionPreference = 'Stop';

#Try uninstall with MSI, otherwise remove registry key
$packageName1 = '*Navisworks Freedom*'
$packageName2 = '*Material Library*'
$validExitCodes = @(0, 3010, 1603, 1605, 1614, 1641)
Get-ItemProperty -Path @('HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
                         'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*') `
                 -ErrorAction:SilentlyContinue `
| Where-Object   {$_.DisplayName -like $packageName1 -or $_.DisplayName -like $packageName2} `
| ForEach-Object {
	$silentArgs = '/qn /norestart'
	$silentArgs = "$($_.PSChildName) $silentArgs"
	Uninstall-ChocolateyPackage -PackageName "$($_.DisplayName)" -FileType "msi" -SilentArgs "$($silentArgs)" -File '' -ValidExitCodes $validExitCodes
	Remove-Item $_.PsPath -Recurse -ErrorAction Ignore
	}

#Remove remaining folders of failed uninstallations
$folderRoot = 'C:\Program Files\Autodesk'
$folderDelete = '*Navisworks Freedom*'
if (Test-Path $folderRoot) { Get-ChildItem $folderRoot -Recurse -Force -Directory -Include $folderDelete | Remove-Item -Recurse -Confirm:$false -Force }

#Remove blocking reboot requests
$RegRebootRequired = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired"
if (Test-path $RegRebootRequired) { Remove-Item -Path $RegRebootRequired }
