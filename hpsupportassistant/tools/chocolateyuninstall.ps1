$ErrorActionPreference = 'Stop';

#support solutions framework is not removed automatically
$packageName = 'HP Support Solutions Framework*'
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
