﻿$ErrorActionPreference = 'Stop';
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$file_Zip       = Join-Path $toolsDir 'setup-27.7.1.9.7z'
$checksum_Zip   = '9865099B8E2E9969A83E64B66B867A5FAA0A14F02D78F2484C95FCF9BECEFBA4'
$packageArgsURL = @{
  packageName   = $env:ChocolateyPackageName
  file          = $file_Zip
  checksum      = $checksum_Zip
  checksumType  = 'sha256'
  unziplocation = $env:TEMP
}

$file_Client = Join-Path $env:TEMP 'Client\setup.exe'
$checksum_Client = 'F6603E4BDFCB5AF04EA9679CABF08B390CC932CF7B970658082D599E54BD0CE9'
$packageArgsClient = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  file          = $file_Client
  softwareName  = 'AxTraxNG Client*'
  checksum      = $checksum_Client
  checksumType  = 'sha256'
  silentArgs    = "/S /v/qn"
  validExitCodes= @(0, 3010, 1641)
}

$file_ConfigTool = Join-Path $env:TEMP 'AxTraxConfigTool\setup.exe'
$checksum_ConfigTool = '81AFBDAA2C39F1A80FEB806C05517DB56F71C1388AD5ABE006D1426E8050480D'
$packageArgsConfigTool = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  file          = $file_ConfigTool
  softwareName  = 'AxTraxNG ConfigTool*'
  checksum      = $checksum_ConfigTool
  checksumType  = 'sha256'
  silentArgs    = "/S /v/qn"
  validExitCodes= @(0, 3010, 1641)
}

$file_Monitor = Join-Path $env:TEMP 'Server Monitor\setup.exe'
$checksum_Monitor = '47492CE43E5633788505D425534388D3181EC8FCBF4FA8B71E0C05AAA72E02DD'
$packageArgsMonitor = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  file          = $file_Monitor
  softwareName  = 'AxTraxNG ServerMonitor*'
  checksum      = $checksum_Monitor
  checksumType  = 'sha256'
  silentArgs    = "/S /v/qn"
  validExitCodes= @(0, 3010, 1641)
}

$file_PreReq = Join-Path $env:TEMP 'Pre_Requisite\setup.exe'
$checksum_PreReq = '8991F94D60CDF190026B542CA9324DCA530373BB22CD8F4550A7A5C6B2E423A4'
$packageArgsPreReq = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  file          = $file_PreReq
  softwareName  = 'AxTraxNG PreReq*'
  checksum      = $checksum_PreReq
  checksumType  = 'sha256'
  silentArgs    = "/S /v/qn"
  validExitCodes= @(0, 3010, 1641)
}

$file_Server = Join-Path $env:TEMP 'Server\setup.exe'
$checksum_Server = 'A60937DCE5598F4C34D8474CF31035FB6FA97DEC156AD337D3E0EC311C538DAB'
$packageArgsServer = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  file          = $file_Server
  softwareName  = 'AxTraxNG Server*'
  checksum      = $checksum_Server
  checksumType  = 'sha256'
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
