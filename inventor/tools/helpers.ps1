function Invoke-UninstallInventor {

#Close software if open
Get-Process "Inventor*", "InvRO*", "dwgviewr*" -ErrorAction SilentlyContinue | Stop-Process -Force

#Remove reboot requests that might stop un/installations
$RegRebootRequired = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired"
Remove-Item -Path $RegRebootRequired -ErrorAction SilentlyContinue

#Remove old versions
$packageName = '*AutoDesk Inventor*'
$packageName2 = '*DWG TrueView*'
$validExitCodes = @(0, 3010, 1603, 1605, 1614, 1641)
Get-ItemProperty -Path @('HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
                         'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*') `
                 -ErrorAction:SilentlyContinue `
| Where-Object   {$_.DisplayName -like $packageName -or $_.DisplayName -like $packageName2} `
| ForEach-Object {
	$silentArgs = "$($_.PSChildName) /qn /norestart"
	if($($_.PSChildName) -like '{*') { Uninstall-ChocolateyPackage -PackageName "$($_.DisplayName)" -FileType "msi" -SilentArgs "$($silentArgs)" -File '' -ValidExitCodes $validExitCodes }
	Remove-Item $_.PsPath -Recurse -ErrorAction Ignore
	}
}
