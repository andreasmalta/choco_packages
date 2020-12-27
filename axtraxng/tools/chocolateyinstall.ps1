$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#$url = 'http://axtraxng.com/support/axtraxng/axtraxng_27_7_1_9.zip'
$url = 'C:\temp\axtraxng_27_7_1_9.zip'
$checksum_url = '63D1D6954C50F76C81A0C90291AE123CBB47836D17801007A6CDA7A22E20843F'
$extract_url = Join-Path $toolsDir 'zip'
$packageArgsURL = @{
  packageName   = $env:ChocolateyPackageName
  url           = $url
  checksum      = $checksum_url
  checksumType  = 'sha256'
  unziplocation = $extract_url
}

$file_exe = Join-Path $toolsDir 'zip\AxTraxNGSetup_V.27.7.1.9_01_01_2020.exe'
$checksum_exe = 'C8A3A8D5177128D9D0B1AB16198C5C90AAC86209BFD3699B157EF488AB2F58D4'
$extract_exe = Join-Path $toolsDir 'exe'
$packageArgsEXE = @{
  packageName   = $env:ChocolateyPackageName
  file          = $file_exe
  checksum      = $checksum_exe
  checksumType  = 'sha256'
  unziplocation = $extract_exe
}

$file_Client = Join-Path $toolsDir 'exe\Client\setup.exe'
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

$file_ConfigTool = Join-Path $toolsDir 'exe\AxTraxConfigTool\setup.exe'
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

$file_Monitor = Join-Path $toolsDir 'exe\Server Monitor\setup.exe'
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

$file_PreReq = Join-Path $toolsDir 'exe\Pre_Requisite\setup.exe'
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

$file_Server = Join-Path $toolsDir 'exe\Server\setup.exe'
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
Install-ChocolateyZipPackage @packageArgsEXE
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
