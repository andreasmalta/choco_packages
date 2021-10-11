$ErrorActionPreference = 'Stop';

#support assistant upgrade & uninstallation is not silent

Get-AppxPackage *HPSupportAssistant* | Remove-AppxPackage -AllUsers
#autohotkey to make silent
#HP Support Assistant Uninstall - Keep Preferences?
#Click the Yes button to keep your settings and preferences if you intend to install HP Support Assistant later
#How do you want to open this?


$folderlong = 'C:\Program Files (x86)\Hewlett-Packard\HP Support Framework\UninstallHPSA.exe'
if (Test-path $folderlong) { 
	$packageArgs = @{
		packageName = $env:ChocolateyPackageName
		fileType    = 'exe'
		silentArgs  = '/s /v /qn'
		file		= $folderlong
	}
Uninstall-ChocolateyPackage @packageArgs
}

$foldershort = 'C:\Program Files (x86)\HP\HP Support Framework\UninstallHPSA.exe'
if (Test-path $foldershort) { 
	$packageArgs = @{
		packageName	= $env:ChocolateyPackageName
		fileType	= 'exe'
		silentArgs	= '/s /v /qn'
		file		= $foldershort
	}
Uninstall-ChocolateyPackage @packageArgs
}

