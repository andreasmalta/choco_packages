$ErrorActionPreference = 'Stop';
$toolsDir        = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$pp              = Get-PackageParameters

if ($pp.'French') {
Write-Host "INSTALLING DWG TRUEVIEW 2023 - FRENCH"
$url             = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/D40E729B-6243-3050-A267-3F664296250F/SFX/DWGTrueView_2023_French_64bit_dlm.sfx.exe'
$checksum        = 'EC47185FC42C5D8C86E607D0111977CC9EA8752DFB0EE1A462FDE6530FF4C05C'
$unzip           = Join-Path $env:TEMP 'DWGTrueView_2023_French_64bit_dlm\x64\dwgviewr\dwgviewr.msi'
$regkey          = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{28B89EEF-5128-040C-0100-CF3F3A09B77D}'
$uninstall       = 'MsiExec.exe /X{28B89EEF-5128-040C-0100-CF3F3A09B77D}'
}

elseif ($pp.'Japanese') {
Write-Host "INSTALLING DWG TRUEVIEW 2023 - JAPANESE"
$url             = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/B2459683-0F7B-36BD-84CB-3D821476766E/SFX/DWGTrueView_2023_Japanese_64bit_dlm.sfx.exe'
$checksum        = '83A3E7F7B36741756A8DEB29924A5DA900133BB440177F3F6046C9D4A5DB95D8'
$unzip           = Join-Path $env:TEMP 'DWGTrueView_2023_Japanese_64bit_dlm\x64\dwgviewr\dwgviewr.msi'
$regkey          = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{28B89EEF-5128-0411-0100-CF3F3A09B77D}'
$uninstall       = 'MsiExec.exe /X{28B89EEF-5128-0411-0100-CF3F3A09B77D}'
}

else {
Write-Host "INSTALLING DWG TRUEVIEW 2023 - ENGLISH"
$url             = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/5E30049E-BFCC-3E1D-B280-6216BD413995/SFX/DWGTrueView_2023_English_64bit_dlm.sfx.exe'
$checksum        = '03AD6A7B69E97BEF719239658EDFB03A996919DF2763592FA35FFBF495BFF946'
$unzip           = Join-Path $env:TEMP 'DWGTrueView_2023_English_64bit_dlm\x64\dwgviewr\dwgviewr.msi'
$regkey          = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{59D6ED58-7BB2-4F80-9632-D1DEA3E8E2BC}'
$uninstall       = 'MsiExec.exe /X{59D6ED58-7BB2-4F80-9632-D1DEA3E8E2BC}'
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

$packageArgsMSI  = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  file           = $unzip
  softwareName   = 'dwgtrueview*'
  silentArgs     = "/q ADSK_SETUP_EXE=1"
  validExitCodes = @(0, 3010, 1641)
}

#remove files and versions from older choco installations before upgrading
$oldextract    = Join-Path $toolsDir 'DWGTrueView*'
$validExitCodes  = @(0, 3010, 1605, 1614, 1641)
$reg2020eng = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{28B89EEF-3028-0409-0100-CF3F3A09B77D}"
if (Test-path $reg2020eng)
{ Uninstall-ChocolateyPackage -PackageName "DWG Trueview 2020" -FileType "msi" -SilentArgs "{28B89EEF-3028-0409-0100-CF3F3A09B77D} /qn /norestart" -File '' -ValidExitCodes $validExitCodes }
$reg2021eng = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{28B89EEF-4128-0409-0100-CF3F3A09B77D}"
if (Test-path $reg2021eng)
{ Uninstall-ChocolateyPackage -PackageName "DWG Trueview 2021" -FileType "msi" -SilentArgs "{28B89EEF-4128-0409-0100-CF3F3A09B77D} /qn /norestart" -File '' -ValidExitCodes $validExitCodes }
Remove-Item $oldextract -Recurse -Force -ErrorAction Ignore

#remove any reboot requests that may block the installation
$RegRebootRequired = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired"
if (Test-path $RegRebootRequired)
{
    Remove-Item -Path $RegRebootRequired
}

#unzip and install (using msi since setup.exe not silent)
Install-ChocolateyPackage @packageArgsUnzip
Install-ChocolateyInstallPackage @packageArgsMSI

#msi installer is missing uninstall entry, creating it manually
if (Test-path $regkey)
{
Set-Itemproperty -path $regkey -Name 'NoRemove' -value '0' -Type dword
Set-Itemproperty -path $regkey -Name 'SystemComponent' -value '0' -Type dword
Set-ItemProperty -path $regkey -name 'UninstallString' -value $uninstall -Type ExpandString
}
