function Invoke-UninstallHPSA {
$folderlong = 'C:\Program Files (x86)\Hewlett-Packard\HP Support Framework\UninstallHPSA.exe'
if (Test-path $folderlong) { Uninstall-ChocolateyPackage -PackageName $env:ChocolateyPackageName -FileType 'exe' -SilentArgs '/s /v /qn' -File "$folderlong" }

$foldershort = 'C:\Program Files (x86)\HP\HP Support Framework\UninstallHPSA.exe'
if (Test-path $foldershort) { Uninstall-ChocolateyPackage -PackageName $env:ChocolateyPackageName -FileType 'exe' -SilentArgs '/s /v /qn' -File "$foldershort" }

Sleep 5
$UninstallHPSA = Get-Process UninstallHPSA.exe -ErrorAction SilentlyContinue
if ($UninstallHPSA) { $UninstallHPSA | Stop-Process -Force }

$packageName = 'HP Support Solutions Framework*'
$validExitCodes = @(0, 3010, 1603, 1605, 1614, 1641)
Get-ItemProperty -Path @('HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
                         'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*') `
                 -ErrorAction:SilentlyContinue `
| Where-Object {$_.DisplayName -like $packageName} `
| ForEach-Object {
	$silentArgs = "$($_.PSChildName) /qn /norestart"
	if($($_.PSChildName) -like '{*') { Uninstall-ChocolateyPackage -PackageName "$($_.DisplayName)" -FileType "msi" -SilentArgs "$($silentArgs)" -File '' -ValidExitCodes $validExitCodes }
	Remove-Item $_.PsPath -Recurse -ErrorAction Ignore
	}
}
