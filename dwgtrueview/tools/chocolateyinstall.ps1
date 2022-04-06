$ErrorActionPreference = 'Stop';

#UNINSTALL OLD VERSIONS
$packageName = '*DWG TrueView*'
$folderRoot = 'C:\Program Files\Autodesk'
$validExitCodes = @(0, 3010, 1603, 1605, 1614, 1641)
Get-ItemProperty -Path @('HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
                         'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*') `
                 -ErrorAction:SilentlyContinue `
| Where-Object   {$_.DisplayName -like $packageName} `
| ForEach-Object {
	$silentArgs = "$($_.PSChildName) /qn /norestart"
	if($($_.PSChildName) -like '{*') { Uninstall-ChocolateyPackage -PackageName "$($_.DisplayName)" -FileType "msi" -SilentArgs "$($silentArgs)" -File '' -ValidExitCodes $validExitCodes }
	Remove-Item $_.PsPath -Recurse -ErrorAction Ignore
	}
if (Test-Path $folderRoot) { Get-ChildItem $folderRoot -Recurse -Force -Directory -Include $packageName | Remove-Item -Recurse -Confirm:$false -Force }


#REMOVE REBOOT REQUESTS
$RegRebootRequired = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired"
if (Test-path $RegRebootRequired) { Remove-Item -Path $RegRebootRequired }


#INSTALLATION SETTINGS
$pp = Get-PackageParameters
if ($pp.'French') {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/D40E729B-6243-3050-A267-3F664296250F/SFX/DWGTrueView_2023_French_64bit_dlm.sfx.exe'
$checksum = 'EC47185FC42C5D8C86E607D0111977CC9EA8752DFB0EE1A462FDE6530FF4C05C'
$file = Join-Path $env:TEMP 'DWGTrueView_2023_French_64bit_dlm\setup.exe'
}

elseif ($pp.'Japanese') {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/B2459683-0F7B-36BD-84CB-3D821476766E/SFX/DWGTrueView_2023_Japanese_64bit_dlm.sfx.exe'
$checksum = '83A3E7F7B36741756A8DEB29924A5DA900133BB440177F3F6046C9D4A5DB95D8'
$file = Join-Path $env:TEMP 'DWGTrueView_2023_Japanese_64bit_dlm\setup.exe'
}

else {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/5E30049E-BFCC-3E1D-B280-6216BD413995/SFX/DWGTrueView_2023_English_64bit_dlm.sfx.exe'
$checksum = '03AD6A7B69E97BEF719239658EDFB03A996919DF2763592FA35FFBF495BFF946'
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
