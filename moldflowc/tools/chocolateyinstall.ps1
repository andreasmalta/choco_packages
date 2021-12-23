$ErrorActionPreference = 'Stop';

$url			= 'https://damassets.autodesk.net/content/dam/autodesk/www/products/moldflow/files/MFC_2021_FCS_Multilingual_Win_64bit_dlm.sfx.exe'
$checksum		= 'D8483B7A1CAB8178E2994734A117FD373FF6F393792091F7C751EB49721BAD2A'
$file           = Join-Path $env:TEMP 'MFC_2021_FCS_Multilingual_Win_64bit_dlm\setup.exe'

#Uninstall 2021.1
$packagename     = 'Autodesk Moldflow Communicator 2021.1'
$productcode     = '{753C779D-0564-4042-8000-8FF1C120CB5E}'
$regkey          = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$productcode"
if (Test-path $regkey) { Uninstall-ChocolateyPackage -PackageName "$packagename" -FileType "msi" -SilentArgs "$productcode /qn /norestart" }

$packageArgsURL = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = $url
  softwareName  = 'autodesk moldflow communicator*'
  checksum      = $checksum
  checksumType  = 'sha256'
  silentArgs    = "-suppresslaunch -d $env:TEMP"
  validExitCodes= @(0, 3010, 1641)
}

$packageArgsFile = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  file          = $file
  softwareName  = 'autodesk moldflow communicator*'
  silentArgs    = "/q /w"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgsURL
Install-ChocolateyInstallPackage @packageArgsFile
