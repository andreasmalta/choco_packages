$ErrorActionPreference = 'Stop';
$toolsDir        = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$pp              = Get-PackageParameters

if ($pp.'French') {
Write-Host "INSTALLING DWG TRUEVIEW 2022 - FRENCH"
$url             = 'https://efulfillment.autodesk.com/NetSWDLD/2022/ACD/14440FCD-9E86-3EBF-855F-4478C8A683D6/SFX/DWGTrueView_2022_French_64bit_dlm.sfx.exe'
$checksum        = '7DA5DA429FDB9619B8EDC83373F3C82C7DFD54258925E642A246B39FB3F3DC2B'
$unzip           = Join-Path $env:TEMP 'DWGTrueView_2022_French_64bit_dlm\x64\dwgviewr\dwgviewr.msi'
$regkey          = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{28B89EEF-5128-040C-0100-CF3F3A09B77D}'
$uninstall       = 'MsiExec.exe /X{28B89EEF-5128-040C-0100-CF3F3A09B77D}'
}

elseif ($pp.'Japanese') {
Write-Host "INSTALLING DWG TRUEVIEW 2022 - JAPANESE"
$url             = 'https://efulfillment.autodesk.com/NetSWDLD/2022/ACD/51735649-303B-3616-ABBC-448420E5C835/SFX/DWGTrueView_2022_Japanese_64bit_dlm.sfx.exe'
$checksum        = 'CAA0D4F25981C68C6FB9F40CA4F3B478D57F1289B6052F8656520324D71DD08B'
$unzip           = Join-Path $env:TEMP 'DWGTrueView_2022_Japanese_64bit_dlm\x64\dwgviewr\dwgviewr.msi'
$regkey          = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{28B89EEF-5128-0411-0100-CF3F3A09B77D}'
$uninstall       = 'MsiExec.exe /X{28B89EEF-5128-0411-0100-CF3F3A09B77D}'
}

else {
Write-Host "INSTALLING DWG TRUEVIEW 2022 - ENGLISH"
$url             = 'https://efulfillment.autodesk.com/NetSWDLD/2022/ACD/D7A6621A-1A6A-3DAC-BBD2-9EB566035195/SFX/DWGTrueView_2022_English_64bit_dlm.sfx.exe'
$checksum        = 'B154E86B005C51232755BA99B89DE0D402D21FD1B42F32021290EDCD2BDC4193'
$unzip           = Join-Path $env:TEMP 'DWGTrueView_2022_English_64bit_dlm\x64\dwgviewr\dwgviewr.msi'
$regkey          = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{28B89EEF-5128-0409-0100-CF3F3A09B77D}'
$uninstall       = 'MsiExec.exe /X{28B89EEF-5128-0409-0100-CF3F3A09B77D}'
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
