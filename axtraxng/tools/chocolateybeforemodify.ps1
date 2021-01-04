$ErrorActionPreference = 'Stop';

$packageName = $env:ChocolateyPackageName
$softwareName = 'AxTraxNG Configuration Tool'
$installerType = 'msi'
$silentArgs = '/qn /norestart'
$validExitCodes = @(0, 3010, 1605, 1614, 1641)
[array]$key = Get-UninstallRegistryKey -SoftwareName $softwareName
$file = "$($key.UninstallString)"
$silentArgs = "$($key.PSChildName) $silentArgs"
$file = ''

Uninstall-ChocolateyPackage `
	-PackageName $packageName `
	-FileType $installerType `
	-SilentArgs "$silentArgs" `
	-ValidExitCodes $validExitCodes `
	-File "$file"
