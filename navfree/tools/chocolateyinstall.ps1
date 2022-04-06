$ErrorActionPreference = 'Stop';

#UNINSTALL OLD VERSIONS
$packageName = '*Navisworks Freedom*'
$packageName2 = '*Material Library*'
$folderRoot = 'C:\Program Files\Autodesk'
$validExitCodes = @(0, 3010, 1603, 1605, 1614, 1641)
Get-ItemProperty -Path @('HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
                         'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*') `
                 -ErrorAction:SilentlyContinue `
| Where-Object   {$_.DisplayName -like $packageName -or $_.DisplayName -like $packageName2} `
| ForEach-Object {
	$silentArgs = "$($_.PSChildName) /qn /norestart"
	if($($_.PSChildName) -like '{*') { Uninstall-ChocolateyPackage -PackageName "$($_.DisplayName)" -FileType "msi" -SilentArgs "$($silentArgs)" -File '' -ValidExitCodes $validExitCodes }
	Remove-Item $_.PsPath -Recurse -ErrorAction Ignore
	}
if (Test-Path $folderRoot) { Get-ChildItem $folderRoot -Recurse -Force -Directory -Include $packageName | Remove-Item -Recurse -Confirm:$false -Force }


#REMOVE REBOOT REQUESTS
$RegRebootRequired = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired"
if (Test-path $RegRebootRequired) { Remove-Item -Path $RegRebootRequired }


#EXTRACT AND INSTALL
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2023/NAVFREE/404ED079-9FE3-3739-BA09-0069D1EDDFB6/SFX/Autodesk_Navisworks_Freedom_2023_Win_64bit_dlm.sfx.exe'
$checksum = '0E90A246692A8D6B71D395E831BFFA856831B5CC2857ABE8B0B972D477010D20'
$file = Join-Path $env:TEMP 'Autodesk_Navisworks_Freedom_2023_Win_64bit_dlm\Setup.exe'

$packageArgsUnzip = @{
  packageName    = 'Navisworks Freedom Installation Files'
  fileType       = 'exe'
  url            = $url
  softwareName   = 'Navisworks Freedom Installation Files*'
  checksum       = $checksum
  checksumType   = 'sha256'
  silentArgs     = "-suppresslaunch -d $env:TEMP"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgsUnzip

$packageArgs  = @{
  packageName    = 'Navisworks Freedom'
  fileType       = 'exe'
  file           = $file
  softwareName   = 'Navisworks Freedom*'
  silentArgs     = '-q'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgs
