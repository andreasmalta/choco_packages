$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$file_Zip = Join-Path $toolsDir 'axtraxng_27_7_1_19.7z'

#Unzip installation files in temp folder
$packageArgsURL = @{
  packageName   = $env:ChocolateyPackageName
  file          = $file_Zip
  unziplocation = $env:TEMP
}
Get-ChocolateyUnzip @packageArgsURL

#Uninstall AxTraxNG
. $toolsDir\helpers.ps1
Invoke-UninstallConfigurationTool

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
	. $toolsDir\helpers.ps1
	Invoke-UninstallServerMonitor
	Invoke-UninstallServer
	Install-ChocolateyInstallPackage @packageArgsServer
	Install-ChocolateyInstallPackage @packageArgsMonitor
}

Write-Host "INSTALLING CLIENT"
. $toolsDir\helpers.ps1
Invoke-UninstallClient
Install-ChocolateyInstallPackage @packageArgsClient
Install-ChocolateyInstallPackage @packageArgsConfigTool
