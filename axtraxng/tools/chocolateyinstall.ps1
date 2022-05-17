$ErrorActionPreference = 'Stop';
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$file_Zip       = Join-Path $toolsDir 'axtraxng_27_7_1_19.7z'

#Unzip installation files in temp folder
$packageArgsURL = @{
  packageName   = $env:ChocolateyPackageName
  file          = $file_Zip
  unziplocation = $env:TEMP
}
Install-ChocolateyZipPackage @packageArgsURL

#Uninstall AxTraxNG Configuration Tool before upgrade
$packageName = 'AxTraxNG Configuration Tool'
$validExitCodes = @(0, 3010, 1603, 1605, 1614, 1641)
Get-ItemProperty -Path @('HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
                         'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*') `
                 -ErrorAction:SilentlyContinue `
| Where-Object   {$_.DisplayName -like $packageName} `
| ForEach-Object {
	$silentArgs = "$($_.PSChildName) /qn /norestart"
	if($($_.PSChildName) -like '{*') { Uninstall-ChocolateyPackage -PackageName "$($_.DisplayName)" -FileType "msi" -SilentArgs "$($silentArgs)" -File '' -ValidExitCodes $validExitCodes }
	}

#Install PreReq
$file_PreReq = Join-Path $env:TEMP 'Pre_Requisite\setup.exe'
$packageArgsPreReq = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  file          = $file_PreReq
  softwareName  = 'AxTraxNG PreReq*'
  silentArgs    = "/S /v/qn"
  validExitCodes= @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgsPreReq

#Install Client
$file_Client = Join-Path $env:TEMP 'Client\setup.exe'
$packageArgsClient = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  file          = $file_Client
  softwareName  = 'AxTraxNG Client*'
  silentArgs    = "/S /v/qn"
  validExitCodes= @(0, 3010, 1641)
}

#Install Config Tool
$file_ConfigTool = Join-Path $env:TEMP 'AxTraxConfigTool\setup.exe'
$packageArgsConfigTool = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  file          = $file_ConfigTool
  softwareName  = 'AxTraxNG ConfigTool*'
  silentArgs    = "/S /v/qn"
  validExitCodes= @(0, 3010, 1641)
}

#Install Server
$file_Server = Join-Path $env:TEMP 'Server\setup.exe'
$packageArgsServer = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  file          = $file_Server
  softwareName  = 'AxTraxNG Server*'
  silentArgs    = "/S /v/qn"
  validExitCodes= @(0, 3010, 1641)
}

#Install Server Monitor
$file_Monitor = Join-Path $env:TEMP 'Server Monitor\setup.exe'
$packageArgsMonitor = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  file          = $file_Monitor
  softwareName  = 'AxTraxNG ServerMonitor*'
  silentArgs    = "/S /v/qn"
  validExitCodes= @(0, 3010, 1641)
}

$pp = Get-PackageParameters
if ($pp.'server') { 
	Write-Host "INSTALLING SERVER"
	
	#Remove old Server Monitor
	$packageName = 'AxTraxNG Server Monitor'
	$validExitCodes = @(0, 3010, 1603, 1605, 1614, 1641)
	Get-ItemProperty -Path @('HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
                         'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*') `
                 -ErrorAction:SilentlyContinue `
	| Where-Object   {$_.DisplayName -like $packageName} `
	| ForEach-Object {
		$silentArgs = "$($_.PSChildName) /qn /norestart"
		if($($_.PSChildName) -like '{*') { Uninstall-ChocolateyPackage -PackageName "$($_.DisplayName)" -FileType "msi" -SilentArgs "$($silentArgs)" -File '' -ValidExitCodes $validExitCodes }
	}

	#Remove old Server
	$packageName = 'AxTraxNG Server'
	$validExitCodes = @(0, 3010, 1603, 1605, 1614, 1641)
	Get-ItemProperty -Path @('HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
                         'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*') `
                 -ErrorAction:SilentlyContinue `
	| Where-Object   {$_.DisplayName -like $packageName} `
	| ForEach-Object {
		$silentArgs = "$($_.PSChildName) /qn /norestart"
		if($($_.PSChildName) -like '{*') { Uninstall-ChocolateyPackage -PackageName "$($_.DisplayName)" -FileType "msi" -SilentArgs "$($silentArgs)" -File '' -ValidExitCodes $validExitCodes }
	}
	
	Install-ChocolateyInstallPackage @packageArgsServer
	Install-ChocolateyInstallPackage @packageArgsMonitor
}

Write-Host "INSTALLING CLIENT"
#Remove old Client
$packageName = 'AxTraxNG Client'
$validExitCodes = @(0, 3010, 1603, 1605, 1614, 1641)
Get-ItemProperty -Path @('HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
                         'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*') `
                 -ErrorAction:SilentlyContinue `
| Where-Object   {$_.DisplayName -like $packageName} `
| ForEach-Object {
	$silentArgs = "$($_.PSChildName) /qn /norestart"
	if($($_.PSChildName) -like '{*') { Uninstall-ChocolateyPackage -PackageName "$($_.DisplayName)" -FileType "msi" -SilentArgs "$($silentArgs)" -File '' -ValidExitCodes $validExitCodes }
	}

Install-ChocolateyInstallPackage @packageArgsClient
Install-ChocolateyInstallPackage @packageArgsConfigTool
