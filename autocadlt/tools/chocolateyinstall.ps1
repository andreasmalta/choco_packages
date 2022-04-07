$ErrorActionPreference = 'Stop';

#UNINSTALL OLD VERSIONS
$packageName = '*AutoCAD LT*'
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
$pp = Get-PackageParameters
if ($pp.'ChineseSimp') {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACDLT/D594DE86-9D39-35EB-A479-2ACB8CC89561/SFX/AutoCAD_LT_2023_Simplified_Chinese_Win_64bit_dlm.sfx.exe'
$checksum = 'D61911957CDAFBEF116C6EB0FE0BF95C03EFB427AFBD6B531EB48ED871DDBA47'
$file = Join-Path $env:TEMP 'AutoCAD_LT_2023_Simplified_Chinese_Win_64bit_dlm\Setup.exe'
}

elseif ($pp.'ChineseTrad') {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACDLT/50E97E66-960D-32F4-B1A8-58D1103CD7CF/SFX/AutoCAD_LT_2023_Traditional_Chinese_Win_64bit_dlm.sfx.exe'
$checksum = 'B64157DE88B80F2563006D30F5856AF39518966A4B1D24F0F42069ACC1D990CE'
$file = Join-Path $env:TEMP 'AutoCAD_LT_2023_Traditional_Chinese_Win_64bit_dlm\Setup.exe'
}

elseif ($pp.'Czech') {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACDLT/B21CFE7B-136A-3F05-A5BA-179CB1D50592/SFX/AutoCAD_LT_2023_Czech_Win_64bit_dlm.sfx.exe'
$checksum = '34939214EA344C5ED85193A7ED600B4DDB8D93C4981776EE34AA52A88497BA22'
$file = Join-Path $env:TEMP 'AutoCAD_LT_2023_Czech_Win_64bit_dlm\Setup.exe'
}

elseif ($pp.'French') {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACDLT/10ED6B08-0212-3FA5-9404-C73EFFAF29DD/SFX/AutoCAD_LT_2023_French_Win_64bit_dlm.sfx.exe'
$checksum = 'F37ED2F3D43A397B3D07F7544AE2614511F93EAA52506B4AD6EEFF2F08948EB1'
$file = Join-Path $env:TEMP 'AutoCAD_LT_2023_French_Win_64bit_dlm\Setup.exe'
}

elseif ($pp.'German') {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACDLT/7C263912-D9C6-340A-BED5-A80C5EC8E53E/SFX/AutoCAD_LT_2023_German_Win_64bit_dlm.sfx.exe'
$checksum = '2EA266312CDFFF72C8B1B04879953DAA86F68074D276C316203536D6704C2F97'
$file = Join-Path $env:TEMP 'AutoCAD_LT_2023_German_Win_64bit_dlm\Setup.exe'
}

elseif ($pp.'Hungarian') {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACDLT/68182B0D-BAC7-36A1-8B76-C26471DD4ECF/SFX/AutoCAD_LT_2023_Hungarian_Win_64bit_dlm.sfx.exe'
$checksum = '50164808203ED3F0FC58F617921E81275B19E404E502887E2D8D5D4706D7462A'
$file = Join-Path $env:TEMP 'AutoCAD_LT_2023_Hungarian_Win_64bit_dlm\Setup.exe'
}

elseif ($pp.'Italian') {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACDLT/50031BF6-2F16-3050-95AE-698F436C021F/SFX/AutoCAD_LT_2023_Italian_Win_64bit_dlm.sfx.exe'
$checksum = 'EE886A450881CC4B4CF7DBB6F22ADD4A375BBEE344F30013C1D2C109A72F2DEE'
$file = Join-Path $env:TEMP 'AutoCAD_LT_2023_Italian_Win_64bit_dlm\Setup.exe'
}

elseif ($pp.'Japanese') {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACDLT/4321A7C7-5F17-3A3C-9D67-8DB35B6AD99E/SFX/AutoCAD_LT_2023_Japanese_Win_64bit_dlm.sfx.exe'
$checksum = 'CAA9097E8C1E253B5C31BB05C7AE10CCA5C59FC4F157BF3DE195DCB8DA12F57D'
$file = Join-Path $env:TEMP 'AutoCAD_LT_2023_Japanese_Win_64bit_dlm\Setup.exe'
}

elseif ($pp.'Korean') {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACDLT/A8FF35BA-2574-305D-B55F-5CBB5410DE3E/SFX/AutoCAD_LT_2023_Korean_Win_64bit_dlm.sfx.exe'
$checksum = '5FADDEB8A20E5D0D6DAD27A7FCF55DD97A73574E223DF6A3092D38745E6FD28D'
$file = Join-Path $env:TEMP 'AutoCAD_LT_2023_Korean_Win_64bit_dlm\Setup.exe'
}

elseif ($pp.'Polish') {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACDLT/4D242DD9-6067-324B-AA03-DAAA19CD5877/SFX/AutoCAD_LT_2023_Polish_Win_64bit_dlm.sfx.exe'
$checksum = '603773710871E337ED76C8C7BD4B2D2D72F02A63B33B47ACFBE149ABBD7DCA99'
$file = Join-Path $env:TEMP 'AutoCAD_LT_2023_Polish_Win_64bit_dlm\Setup.exe'
}

elseif ($pp.'Portuguese') {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACDLT/C3F821B8-C774-34E2-9290-FE7AABF8FFAD/SFX/AutoCAD_LT_2023_Brazilian_Portuguese_Win_64bit_dlm.sfx.exe'
$checksum = '16E23F7AFED2D2722A4B171FFF1D54171CF0DC6506622431DF28770AC81C75DB'
$file = Join-Path $env:TEMP 'AutoCAD_LT_2023_Brazilian_Portuguese_Win_64bit_dlm\Setup.exe'
}

elseif ($pp.'Russian') {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACDLT/0C7D5A7A-1911-3480-956F-458B3C605859/SFX/AutoCAD_LT_2023_Russian_Win_64bit_dlm.sfx.exe'
$checksum = '56E2F32F3ED2E6E1ABA4E6F048AF46B713361933776FDFEDC1EF1A9D0EE0D7B2'
$file = Join-Path $env:TEMP 'AutoCAD_LT_2023_Russian_Win_64bit_dlm\Setup.exe'
}

elseif ($pp.'Spanish') {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACDLT/A95FC3A0-6C69-3433-BE4D-ED07DF85668F/SFX/AutoCAD_LT_2023_Spanish_Win_64bit_dlm.sfx.exe'
$checksum = '6956282ED0F7E348A0B9C496913EA64DD07724D128824133D1B5884EB4D96FF0'
$file = Join-Path $env:TEMP 'AutoCAD_LT_2023_Spanish_Win_64bit_dlm\Setup.exe'
}

else {
$url = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACDLT/C8DC0A93-1BFB-3C0D-B3B6-1BD06D06CCC2/SFX/AutoCAD_LT_2023_English_Win_64bit_dlm.sfx.exe'
$checksum = 'BA24E7616A814938E27995B1CB67ACCF83455603CCE407BACAF88ABC97FDECB5'
$file = Join-Path $env:TEMP 'AutoCAD_LT_2023_English_Win_64bit_dlm\Setup.exe'
}

$packageArgsUnzip = @{
  packageName    = 'AutoCAD LT Installation Files'
  fileType       = 'exe'
  url            = $url
  softwareName   = 'AutoCAD LT Installation Files*'
  checksum       = $checksum
  checksumType   = 'sha256'
  silentArgs     = "-suppresslaunch -d $env:TEMP"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgsUnzip

$packageArgs  = @{
  packageName    = 'AutoCAD LT'
  fileType       = 'exe'
  file           = $file
  softwareName   = 'AutoCAD LT*'
  silentArgs     = '-q'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgs
