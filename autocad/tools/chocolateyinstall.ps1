$ErrorActionPreference = 'Stop';

#UNINSTALL OLD VERSIONS
$packageName = '*AutoCAD*'
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


#ENGLISH
$packageName = 'AutoCAD_2023_English_Win_64bit_dlm'
$url1 = 'Z:\autocad\AutoCAD_2023_English_Win_64bit_dlm_001_002.sfx.exe'
#$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/73A78CE1-E03A-3415-826E-91A699E39B17/SFX/AutoCAD_2023_English_Win_64bit_dlm_001_002.sfx.exe'
$checksum1 = '07B80B205D5E9ED3CB4A8908D20292485AEE3F4E29884FE3C1B42C97CD1B7751'
$url2 = 'Z:\autocad\AutoCAD_2023_English_Win_64bit_dlm_002_002.sfx.exe'
#$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/73A78CE1-E03A-3415-826E-91A699E39B17/SFX/AutoCAD_2023_English_Win_64bit_dlm_002_002.sfx.exe'
$checksum2 = '62D9761408E7E18588820A78159C35BF6FE28D2B84C690F32BC856A151D74428'

$temp = Join-Path $env:TEMP $packageName
write-host $temp
$part1 = $temp + '_001_002.sfx.exe'
write-host $part1
$part2 = $temp + '_002_002.sfx.exe'
write-host $part2
$file = Join-Path $temp 'Setup.exe'
Get-ChocolateyWebFile -PackageName 'AutoCAD Download Part 1' -FileFullPath $part1 -Url $url1 -Checksum $checksum1 -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'AutoCAD Download Part 2' -FileFullPath $part2 -Url $url2 -Checksum $checksum2 -ChecksumType 'sha256'

$packageArgsUnzip  = @{
  packageName    = 'AutoCAD Installation Files'
  fileType       = 'exe'
  file           = $part1
  softwareName   = 'AutoCAD Installation Files*'
  silentArgs     = "-suppresslaunch -d $env:TEMP"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgsUnzip

$packageArgs  = @{
  packageName    = 'AutoCAD'
  fileType       = 'exe'
  file           = $file
  softwareName   = 'AutoCAD*'
  silentArgs     = '-q'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgs
