$ErrorActionPreference = 'Stop';
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$file_Zip       = Join-Path $toolsDir 'AxTraxNGSetup_V.27.7.1.18_11_04_2021.7z'
$packageArgsURL = @{
  packageName   = $env:ChocolateyPackageName
  file          = $file_Zip
  unziplocation = $env:TEMP
}

$file_Client = Join-Path $env:TEMP 'Client\setup.exe'
$packageArgsClient = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  file          = $file_Client
  softwareName  = 'AxTraxNG Client*'
  silentArgs    = "/S /v/qn"
  validExitCodes= @(0, 3010, 1641)
}

$file_ConfigTool = Join-Path $env:TEMP 'AxTraxConfigTool\setup.exe'
$packageArgsConfigTool = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  file          = $file_ConfigTool
  softwareName  = 'AxTraxNG ConfigTool*'
  silentArgs    = "/S /v/qn"
  validExitCodes= @(0, 3010, 1641)
}

$file_Monitor = Join-Path $env:TEMP 'Server Monitor\setup.exe'
$packageArgsMonitor = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  file          = $file_Monitor
  softwareName  = 'AxTraxNG ServerMonitor*'
  silentArgs    = "/S /v/qn"
  validExitCodes= @(0, 3010, 1641)
}

$file_PreReq = Join-Path $env:TEMP 'Pre_Requisite\setup.exe'
$packageArgsPreReq = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  file          = $file_PreReq
  softwareName  = 'AxTraxNG PreReq*'
  silentArgs    = "/S /v/qn"
  validExitCodes= @(0, 3010, 1641)
}

$file_Server = Join-Path $env:TEMP 'Server\setup.exe'
$packageArgsServer = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  file          = $file_Server
  softwareName  = 'AxTraxNG Server*'
  silentArgs    = "/S /v/qn"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyZipPackage @packageArgsURL
Install-ChocolateyInstallPackage @packageArgsPreReq

$pp = Get-PackageParameters
if ($pp.'server') { 
	Write-Host "INSTALLING SERVER"
	Install-ChocolateyInstallPackage @packageArgsServer
	Install-ChocolateyInstallPackage @packageArgsMonitor
}
Write-Host "INSTALLING CLIENT"
Install-ChocolateyInstallPackage @packageArgsClient
Install-ChocolateyInstallPackage @packageArgsConfigTool
