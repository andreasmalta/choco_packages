function Invoke-UninstallOLD {

#Close software if open
Get-Process "revit*" -ErrorAction SilentlyContinue | Stop-Process -Force

#Remove reboot requests that might stop un/installations
$RegRebootRequired = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired"
Remove-Item -Path $RegRebootRequired -ErrorAction SilentlyContinue

#Remove old versions
$packageName = '*Revit*'
$folderRoot = 'C:\Program Files\Autodesk'
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
Get-ChildItem $folderRoot -Recurse -Force -Directory -ErrorAction SilentlyContinue -Include $packageName | Remove-Item -Recurse -Confirm:$false -Force
}
