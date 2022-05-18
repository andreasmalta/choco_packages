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
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/9F180917-4277-3998-AFDB-C9477508D3AE/SFX/DWGTrueView_2023_French_64bit_dlm.sfx.exe'
$checksum = '1C54998314BD13D75FAF5C352266F1034B6D458162532451BF393B380F3D93A9'
$file = Join-Path $env:TEMP 'DWGTrueView_2023_French_64bit_dlm\setup.exe'
}

elseif ($pp.'Japanese') {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/1D3E70AB-9E61-3244-A4CF-EADDFC9B9554/SFX/DWGTrueView_2023_Japanese_64bit_dlm.sfx.exe'
$checksum = '5E099980D9FAD6C5EEF2CB4E5E96C6191558FF76604C4658E6598D924EFCEA5E'
$file = Join-Path $env:TEMP 'DWGTrueView_2023_Japanese_64bit_dlm\setup.exe'
}

else {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/EC2FCD9E-AC4D-3E9D-8526-96832A231455/SFX/DWGTrueView_2023_English_64bit_dlm.sfx.exe'
$checksum = '3D1EB9AD56044D3980F2B14686327E4CB19D0F7378A8EFECBCC6D5BE8B814F43'
$file = Join-Path $env:TEMP 'DWGTrueView_2023_English_64bit_dlm\Setup.exe'
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
