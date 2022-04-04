$ErrorActionPreference = 'Stop';
$toolsDir        = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$pp              = Get-PackageParameters


#UNINSTALL OLD VERSIONS
$packageName = '*DWG TrueView*'
$folderRoot = 'C:\Program Files\Autodesk'
$folderDelete = '*DWG TrueView*'
$validExitCodes = @(0, 3010, 1603, 1605, 1614, 1641)
Get-ItemProperty -Path @('HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
                         'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*') `
                 -ErrorAction:SilentlyContinue `
| Where-Object   {$_.DisplayName -like $packageName} `
| ForEach-Object {
	$silentArgs = "$($_.PSChildName) /qn /norestart"
	Uninstall-ChocolateyPackage -PackageName "$($_.DisplayName)" -FileType "msi" -SilentArgs "$($silentArgs)" -File '' -ValidExitCodes $validExitCodes
	Remove-Item $_.PsPath -Recurse -ErrorAction Ignore
	}
if (Test-Path $folderRoot) { Get-ChildItem $folderRoot -Recurse -Force -Directory -Include $folderDelete | Remove-Item -Recurse -Confirm:$false -Force }


#REMOVE REBOOT REQUESTS
$RegRebootRequired = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired"
if (Test-path $RegRebootRequired) { Remove-Item -Path $RegRebootRequired }


#INSTALLATION SETTINGS
if ($pp.'French') {
Write-Host "INSTALLING DWG TRUEVIEW 2023 - FRENCH"
$url             = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/D40E729B-6243-3050-A267-3F664296250F/SFX/DWGTrueView_2023_French_64bit_dlm.sfx.exe'
$checksum        = 'EC47185FC42C5D8C86E607D0111977CC9EA8752DFB0EE1A462FDE6530FF4C05C'
$unzip           = Join-Path $env:TEMP 'DWGTrueView_2023_French_64bit_dlm\x64\dwgviewr\dwgviewr.msi'
}

elseif ($pp.'Japanese') {
Write-Host "INSTALLING DWG TRUEVIEW 2023 - JAPANESE"
$url             = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/B2459683-0F7B-36BD-84CB-3D821476766E/SFX/DWGTrueView_2023_Japanese_64bit_dlm.sfx.exe'
$checksum        = '83A3E7F7B36741756A8DEB29924A5DA900133BB440177F3F6046C9D4A5DB95D8'
$unzip           = Join-Path $env:TEMP 'DWGTrueView_2023_Japanese_64bit_dlm\x64\dwgviewr\dwgviewr.msi'
}

else {
Write-Host "INSTALLING DWG TRUEVIEW 2023 - ENGLISH"
$url             = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/5E30049E-BFCC-3E1D-B280-6216BD413995/SFX/DWGTrueView_2023_English_64bit_dlm.sfx.exe'
$checksum        = '03AD6A7B69E97BEF719239658EDFB03A996919DF2763592FA35FFBF495BFF946'
$unzip           = Join-Path $env:TEMP 'DWGTrueView_2023_English_64bit_dlm\x64\dwgviewr\dwgviewr.msi'
}

$packageArgsUnzip = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = $url
  softwareName   = 'dwgtrueview*'
  checksum       = $checksum
  checksumType   = 'sha256'
  silentArgs     = "-suppresslaunch -d $env:TEMP"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgsUnzip

$packageArgsMSI  = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  file           = $unzip
  softwareName   = 'dwgtrueview*'
  silentArgs     = "/q ADSK_SETUP_EXE=1"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgsMSI


#CREATING MSI UNINSTALLER
$packageName = 'DWG TrueView 2023*'
Get-ItemProperty -Path @('HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
                         'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*') `
                 -ErrorAction:SilentlyContinue `
| Where-Object   {$_.DisplayName -like $packageName} `
| ForEach-Object {
    Set-Itemproperty -path $_.PsPath -Name 'NoRemove' -value '0' -Type dword
	Set-Itemproperty -path $_.PsPath -Name 'SystemComponent' -value '0' -Type dword
	Set-ItemProperty -path $_.PsPath -name 'UninstallString' -value "MsiExec.exe /I$($_.PSChildName)" -Type ExpandString
	}
