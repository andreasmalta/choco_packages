$ErrorActionPreference = 'Stop';
$packageName = 'FBX Game Recorder'
$validExitCodes = @(0, 3010, 1603, 1605, 1614, 1641)
Get-ItemProperty -Path @('HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
                         'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*') `
                 -ErrorAction:SilentlyContinue `
| Where-Object   {$_.DisplayName -like $packageName} `
| ForEach-Object {
	$uninstall = "$($_.UninstallString)"
	Write-Host $uninstall
	Uninstall-ChocolateyPackage -PackageName "$($_.DisplayName)" -FileType "exe" -SilentArgs "/S" -File $uninstall
}
