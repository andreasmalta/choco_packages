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


#EXTRACT AND INSTALL
$pp = Get-PackageParameters
if ($pp.'ChineseSimp') {
$packageName = 'AutoCAD_2023_Simplified_Chinese_Win_64bit_dlm'
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/8FB3A471-BAFE-379D-AE7F-9ECF1E74401D/SFX/AutoCAD_2023_Simplified_Chinese_Win_64bit_dlm_001_002.sfx.exe'
$checksum1 = '479ECC29FD86A43A445B0BE94AB88963AE10C5EE351230184509719FFA87BC2C'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/8FB3A471-BAFE-379D-AE7F-9ECF1E74401D/SFX/AutoCAD_2023_Simplified_Chinese_Win_64bit_dlm_002_002.sfx.exe'
$checksum2 = 'B54342945A0FF3DA2579451094A6075DBF8FF630B8F59938402E2CF3B8989541'
}

elseif ($pp.'ChineseTrad') {
$packageName = 'AutoCAD_2023_Traditional_Chinese_Win_64bit_dlm'
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/2A943BBD-E61B-3E2B-AD2B-007D350F2177/SFX/AutoCAD_2023_Traditional_Chinese_Win_64bit_dlm_001_002.sfx.exe'
$checksum1 = 'B6019E40BE90261F14C305D44EF1D43C85C0A9A0377A565B91C580E9062C8FCD'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/2A943BBD-E61B-3E2B-AD2B-007D350F2177/SFX/AutoCAD_2023_Traditional_Chinese_Win_64bit_dlm_002_002.sfx.exe'
$checksum2 = '35E208D384E7FC939EF52C35F24CC2B618AB87E232C2511243650ABAD7E48CB0'
}

elseif ($pp.'Czech') {
$packageName = 'AutoCAD_2023_Czech_Win_64bit_dlm'
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/9E552C26-38D6-37FA-B05E-B21AD669358E/SFX/AutoCAD_2023_Czech_Win_64bit_dlm_001_002.sfx.exe'
$checksum1 = '207E1BD1D9EAC797A5CD95BD4FDF1CC61EDB0AC568739A9E19A017F21106DF32'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/9E552C26-38D6-37FA-B05E-B21AD669358E/SFX/AutoCAD_2023_Czech_Win_64bit_dlm_002_002.sfx.exe'
$checksum2 = 'D0BC4C599A5D2303777452D181DB9ADAB4F9D6DA8D0FC68120FD6C01A43DDB2B'
}

elseif ($pp.'French') {
$packageName = 'AutoCAD_2023_French_Win_64bit_dlm'
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/423E5E4A-E412-31C8-94B8-7A1171D35541/SFX/AutoCAD_2023_French_Win_64bit_dlm_001_002.sfx.exe'
$checksum1 = '0BC7A839D5A8F22B0C4A0F727FB64623A6560D38134BBEFAFA21B3BB73647C21'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/423E5E4A-E412-31C8-94B8-7A1171D35541/SFX/AutoCAD_2023_French_Win_64bit_dlm_002_002.sfx.exe'
$checksum2 = '0688AEB922EA1F153604CD8EB546F7D6B36B9A580454BF8A517FAC931DD2FA75'
}

elseif ($pp.'German') {
$packageName = 'AutoCAD_2023_German_Win_64bit_dlm'
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/76AB97BD-B32D-3F5A-B05F-3F09F9AFB666/SFX/AutoCAD_2023_German_Win_64bit_dlm_001_002.sfx.exe'
$checksum1 = 'DA9B4F6074B687A9F9732AA66F45108F30C911035EC11020E3D83E5265A8774B'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/76AB97BD-B32D-3F5A-B05F-3F09F9AFB666/SFX/AutoCAD_2023_German_Win_64bit_dlm_002_002.sfx.exe'
$checksum2 = '63F45D0FDC7D87E880ED0E7C2E802EA9E283284970530100AF1CB0710C844AA9'
}

elseif ($pp.'Hungarian') {
$packageName = 'AutoCAD_2023_Hungarian_Win_64bit_dlm'
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/F4E61065-57C9-3D46-9C2F-F5B5D126F502/SFX/AutoCAD_2023_Hungarian_Win_64bit_dlm_001_002.sfx.exe'
$checksum1 = 'EAB3055D827681DC135F02708910B99D35939334D66ED6E859CA6B5653734F14'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/F4E61065-57C9-3D46-9C2F-F5B5D126F502/SFX/AutoCAD_2023_Hungarian_Win_64bit_dlm_002_002.sfx.exe'
$checksum2 = '56ABC80A0E6BB0E72BD3297AF2B3068A9F34FABE0150B5E13B76300237555BC5'
}

elseif ($pp.'Italian') {
$packageName = 'AutoCAD_2023_Italian_Win_64bit_dlm'
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/287D32F7-4770-3EF5-AD3B-9FB62BAFB06A/SFX/AutoCAD_2023_Italian_Win_64bit_dlm_001_002.sfx.exe'
$checksum1 = '23A0B7CC616E71C2DE11E343AB13520AE0A4637AAC893FAD0D4C2CC6A6FC0789'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/287D32F7-4770-3EF5-AD3B-9FB62BAFB06A/SFX/AutoCAD_2023_Italian_Win_64bit_dlm_002_002.sfx.exe'
$checksum2 = '9E57A3294EDBF2256C24AC89447A02E0E9A5B9593C0047B9664E6C45613399A1'
}

elseif ($pp.'Japanese') {
$packageName = 'AutoCAD_2023_Japanese_Win_64bit_dlm'
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/33807360-14CD-3CE0-89D4-EA4021D518CB/SFX/AutoCAD_2023_Japanese_Win_64bit_dlm_001_002.sfx.exe'
$checksum1 = '1089361535D9483B3D4516BE0703786B0A29BC550315E77A6425A7A3AF0FC2AB'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/33807360-14CD-3CE0-89D4-EA4021D518CB/SFX/AutoCAD_2023_Japanese_Win_64bit_dlm_002_002.sfx.exe'
$checksum2 = 'EDC8EE8070359CFD4020DD9AC88F81A5D2058C65C1F1F7B58156803A5FAAD0B2'
}

elseif ($pp.'Korean') {
$packageName = 'AutoCAD_2023_Korean_Win_64bit_dlm'
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/832DD47E-549C-395D-964F-9819BE7F2E79/SFX/AutoCAD_2023_Korean_Win_64bit_dlm_001_002.sfx.exe'
$checksum1 = '73C2ED9113171F248507F7501CCB69ED1B5C4BF8C50D1BE93EE2A4A133AB7115'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/832DD47E-549C-395D-964F-9819BE7F2E79/SFX/AutoCAD_2023_Korean_Win_64bit_dlm_002_002.sfx.exe'
$checksum2 = 'EE4F681466407CDB7EEC29D671682CB949B080E8C781414082EFB7BE1F4C715C'
}

elseif ($pp.'Polish') {
$packageName = 'AutoCAD_2023_Polish_Win_64bit_dlm'
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/D69B2FE9-92E0-3664-A8FD-EAD873C7FE56/SFX/AutoCAD_2023_Polish_Win_64bit_dlm_001_002.sfx.exe'
$checksum1 = 'CE579FFFC04EC21473A972C8BF4B696E9DD9CFA1470250C41519074C057AD7BB'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/D69B2FE9-92E0-3664-A8FD-EAD873C7FE56/SFX/AutoCAD_2023_Polish_Win_64bit_dlm_002_002.sfx.exe'
$checksum2 = '11EEBC524D4DD729A066CCE6B6AD6E685F051A65065891952965D94EF3FD72A5'
}

elseif ($pp.'Portuguese') {
$packageName = 'AutoCAD_2023_Brazilian_Portuguese_Win_64bit_dlm'
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/77E4168D-B260-35B3-9FA0-3708351E6B04/SFX/AutoCAD_2023_Brazilian_Portuguese_Win_64bit_dlm_001_002.sfx.exe'
$checksum1 = '7ADFA3F100C7F32027ED8E8B2C3DCA722BF907693AA408D2E75071D2D9F0E696'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/77E4168D-B260-35B3-9FA0-3708351E6B04/SFX/AutoCAD_2023_Brazilian_Portuguese_Win_64bit_dlm_002_002.sfx.exe'
$checksum2 = 'E85ABA7BEBFBEAF58A607B377B4BFC76C72E5DE5D4C9A1BF51B8CAF47291CD97'
}

elseif ($pp.'Russian') {
$packageName = 'AutoCAD_2023_Russian_Win_64bit_dlm'
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/8C2B07F1-8A0B-34E9-B622-17451D0926FC/SFX/AutoCAD_2023_Russian_Win_64bit_dlm_001_002.sfx.exe'
$checksum1 = '2F0DC81FC858EEF50CB28DAF5A7F94FDB52988D76CD5ABCAF289E6DF304CAA8D'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/8C2B07F1-8A0B-34E9-B622-17451D0926FC/SFX/AutoCAD_2023_Russian_Win_64bit_dlm_002_002.sfx.exe'
$checksum2 = 'A8FE4FEFDC3A4BE8A60FD0D78FBF85860A13E2908067614CC0AA804853BD3A90'
}

elseif ($pp.'Spanish') {
$packageName = 'AutoCAD_2023_Spanish_Win_64bit_dlm'
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/D69227B0-7A1E-3897-9349-31E4C72A8ADC/SFX/AutoCAD_2023_Spanish_Win_64bit_dlm_001_002.sfx.exe'
$checksum1 = 'C4FED09EADCD5DF398C2B6EE2F88028E706A90FDEEB04A5F06C8E605FC700E53'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/D69227B0-7A1E-3897-9349-31E4C72A8ADC/SFX/AutoCAD_2023_Spanish_Win_64bit_dlm_002_002.sfx.exe'
$checksum2 = '95C35F834D2853E25047B17C7E7D11B6EC83B7F3DBD57765B811E4D1A098B310'
}

else {
$packageName = 'AutoCAD_2023_English_Win_64bit_dlm'
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/73A78CE1-E03A-3415-826E-91A699E39B17/SFX/AutoCAD_2023_English_Win_64bit_dlm_001_002.sfx.exe'
$checksum1 = '07B80B205D5E9ED3CB4A8908D20292485AEE3F4E29884FE3C1B42C97CD1B7751'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/73A78CE1-E03A-3415-826E-91A699E39B17/SFX/AutoCAD_2023_English_Win_64bit_dlm_002_002.sfx.exe'
$checksum2 = '62D9761408E7E18588820A78159C35BF6FE28D2B84C690F32BC856A151D74428'
}

$temp = Join-Path $env:TEMP $packageName
$part1 = $temp + '_001_002.sfx.exe'
$part2 = $temp + '_002_002.sfx.exe'
$file = Join-Path $temp 'Setup.exe'
Get-ChocolateyWebFile -PackageName 'AutoCAD Download Part 1' -FileFullPath $part1 -Url $url1 -Checksum $checksum1 -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'AutoCAD Download Part 2' -FileFullPath $part2 -Url $url2 -Checksum $checksum2 -ChecksumType 'sha256'

$packageArgsUnzip  = @{
  packageName    = 'AutoCAD Installation Files'
  fileType       = 'exe'
  file           = $part1
  softwareName   = 'AutoCAD Installation Files*'
  silentArgs     = "-suppresslaunch -d '$env:TEMP'"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgsUnzip

$packageArgs  = @{
  packageName    = 'AutoCAD'
  fileType       = 'exe'
  file           = $file
  softwareName   = 'AutoCAD*'
  silentArgs     = '-q'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgs
