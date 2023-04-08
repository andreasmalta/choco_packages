$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

. $toolsDir\helpers.ps1
Invoke-UninstallOldTrueView

#REMOVE REBOOT REQUESTS
$RegRebootRequired = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired"
if (Test-path $RegRebootRequired) { Remove-Item -Path $RegRebootRequired }

#INSTALLATION SETTINGS
$pp = Get-PackageParameters
if ($pp.'French') {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACD/2D15294B-542A-393B-9197-37F3D33DEFF3/SFX/DWGTrueView_2024_French_64bit_dlm.sfx.exe'
$checksum = '3E36ACDBD06EA7A348F57005546155B9B49538F6E821333D8157FE9958DE4A49'
$file = Join-Path $env:TEMP 'DWGTrueView_2024_French_64bit_dlm\setup.exe'
}

elseif ($pp.'Japanese') {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACD/9C18555B-A10A-36B3-9F02-4815156C448B/SFX/DWGTrueView_2024_Japanese_64bit_dlm.sfx.exe'
$checksum = 'C3FA4C1639BD2748B0F16725434A0F0F00DDA62FBDDF54907FA24D85DB722F61'
$file = Join-Path $env:TEMP 'DWGTrueView_2024_Japanese_64bit_dlm\setup.exe'
}

else {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACD/9C02048D-D0DB-3E06-B903-89BD24380AAD/SFX/DWGTrueView_2024_English_64bit_dlm.sfx.exe'
$checksum = 'F6B52F8E01A2951773433D5B8A1491B21E77F8E157870594DB57FEDDCBA7C5BC'
$file = Join-Path $env:TEMP 'DWGTrueView_2024_English_64bit_dlm\Setup.exe'
}

$packageArgsUnzip = @{
  packageName    = 'DWG TrueView Installation Files'
  fileType       = 'exe'
  url            = $url
  softwareName   = 'DWG TrueView Installation Files*'
  checksum       = $checksum
  checksumType   = 'sha256'
  silentArgs     = "-suppresslaunch -d $env:TEMP"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgsUnzip

$packageArgs  = @{
  packageName    = 'DWG TrueView'
  fileType       = 'exe'
  file           = $file
  softwareName   = 'DWG TrueView*'
  silentArgs     = '-q'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgs
