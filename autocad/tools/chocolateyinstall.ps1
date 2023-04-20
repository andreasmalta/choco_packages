$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#UNINSTALL OLD VERSIONS
. $toolsDir\helpers.ps1
Invoke-UninstallOld

#LANGUAGES
$pp = Get-PackageParameters
if ($pp.'ChineseSimp') {
$packageName = 'AutoCAD_2024_Simplified_Chinese_Win_64bit_dlm'
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACD/C0D3A90A-5925-3283-B826-68A4EAF3698A/SFX/AutoCAD_2024_Simplified_Chinese_Win_64bit_dlm_001_002.sfx.exe'
$checksum1 = 'A54387D6E4C64FDC3701B2157ACAFE518E3E95A8751B06D116673340A907CD61'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACD/C0D3A90A-5925-3283-B826-68A4EAF3698A/SFX/AutoCAD_2024_Simplified_Chinese_Win_64bit_dlm_002_002.sfx.exe'
$checksum2 = '5328A6620501FB2430B1276F9911970018BF4C201E5F409AE2F1DC72D0B648E0'
}

elseif ($pp.'ChineseTrad') {
$packageName = 'AutoCAD_2024_Traditional_Chinese_Win_64bit_dlm'
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACD/DDF43270-FC4E-3B3D-8E58-6AA772EFC4DD/SFX/AutoCAD_2024_Traditional_Chinese_Win_64bit_dlm_001_002.sfx.exe'
$checksum1 = 'F0108974ADA978D3A1FC7D05FF10D8693757737B9F26C8155F378986030D1A19'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACD/DDF43270-FC4E-3B3D-8E58-6AA772EFC4DD/SFX/AutoCAD_2024_Traditional_Chinese_Win_64bit_dlm_002_002.sfx.exe'
$checksum2 = 'B7485F460C0BC50BE5D5211B298680D8866B6587B36D6225A07D3C2ED0B38553'
}

elseif ($pp.'Czech') {
$packageName = 'AutoCAD_2024_Czech_Win_64bit_dlm'
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACD/0A931BD6-E930-3242-9C98-038D50791164/SFX/AutoCAD_2024_Czech_Win_64bit_dlm_001_002.sfx.exe'
$checksum1 = 'FA5B15655B12FEF1A384D3F6DB88641FDC2FF48A2A24B5BD1AC6830E72263743'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACD/0A931BD6-E930-3242-9C98-038D50791164/SFX/AutoCAD_2024_Czech_Win_64bit_dlm_002_002.sfx.exe'
$checksum2 = '4036C5BE7DBD0FD2AAD7CDE982C6C31E7B80F1D7C66F0ED9E6F0F10B1A96BCA4'
}

elseif ($pp.'French') {
$packageName = 'AutoCAD_2024_French_Win_64bit_dlm'
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACD/3E58E777-D28C-3868-9F91-FEAB7C97C4AC/SFX/AutoCAD_2024_French_Win_64bit_dlm_001_002.sfx.exe'
$checksum1 = 'C32F7E2A65F5A78977FE654C9197ABA8F4C6D2B4ABCC503B410D6E28E4A6A7D7'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACD/3E58E777-D28C-3868-9F91-FEAB7C97C4AC/SFX/AutoCAD_2024_French_Win_64bit_dlm_002_002.sfx.exe'
$checksum2 = '224CEB57979E264C876005C86457F6E5FE9415829D1DE36B127477491568D37F'
}

elseif ($pp.'German') {
$packageName = 'AutoCAD_2024_German_Win_64bit_dlm'
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACD/8DED2519-8071-3D9F-8FAD-C434081E8B61/SFX/AutoCAD_2024_German_Win_64bit_dlm_001_002.sfx.exe'
$checksum1 = 'ACB4B8D4FBFFA62845E83ED56426F5A5FEAEBCC1C5E429C986DB30C5B4FADA37'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACD/8DED2519-8071-3D9F-8FAD-C434081E8B61/SFX/AutoCAD_2024_German_Win_64bit_dlm_002_002.sfx.exe'
$checksum2 = 'B01A0465F7DDAC41338EAADF50CE74DFDCF017191551E1836E9EFDB076DEF894'
}

elseif ($pp.'Hungarian') {
$packageName = 'AutoCAD_2024_Hungarian_Win_64bit_dlm'
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACD/096E7ADC-6D8E-3159-B087-933C94D3755F/SFX/AutoCAD_2024_Hungarian_Win_64bit_dlm_001_002.sfx.exe'
$checksum1 = 'F61B1C95018304CCC98EE3FB55E33273FA2CB62FEF885D3741A3999B22158FD9'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACD/096E7ADC-6D8E-3159-B087-933C94D3755F/SFX/AutoCAD_2024_Hungarian_Win_64bit_dlm_002_002.sfx.exe'
$checksum2 = 'EF2CBBB7AE620A164EB6321A54B4222F53FA9EFD0AAB8BC65ED7BDF1FBB06B02'
}

elseif ($pp.'Italian') {
$packageName = 'AutoCAD_2024_Italian_Win_64bit_dlm'
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACD/D8B80308-A8A1-3E19-AD1D-4AAD8E98277F/SFX/AutoCAD_2024_Italian_Win_64bit_dlm_001_002.sfx.exe'
$checksum1 = 'ABEC05E5BD7B32A2CFD9CC57A46E5E5D93EC417BE233C578A0C678CAEFF708CC'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACD/D8B80308-A8A1-3E19-AD1D-4AAD8E98277F/SFX/AutoCAD_2024_Italian_Win_64bit_dlm_002_002.sfx.exe'
$checksum2 = '67BCCFD2FCB72A16C06A7E4F0E1E9A249095904F9DA334268AFA3813A82F84B9'
}

elseif ($pp.'Japanese') {
$packageName = 'AutoCAD_2024_Japanese_Win_64bit_dlm'
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACD/DD74AC9B-B571-32CE-A667-0A4B6BA8DFB4/SFX/AutoCAD_2024_Japanese_Win_64bit_dlm_001_002.sfx.exe'
$checksum1 = '2E2142666D0F44A189A4A8BCDDAE199F54BEED813609E1AB77F1615BE9565174'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACD/DD74AC9B-B571-32CE-A667-0A4B6BA8DFB4/SFX/AutoCAD_2024_Japanese_Win_64bit_dlm_002_002.sfx.exe'
$checksum2 = 'D27CBF021722CC5209B5C32B0C36CB10AAE4A35821F5EF7B4C77628598E0BE0A'
}

elseif ($pp.'Korean') {
$packageName = 'AutoCAD_2024_Korean_Win_64bit_dlm'
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACD/2BBD2191-BB12-3557-8D70-4B33544CA3E0/SFX/AutoCAD_2024_Korean_Win_64bit_dlm_001_002.sfx.exe'
$checksum1 = '6986EB066019EE17E6626E25E52A15340264BDA7658C1F3474E8B37BEB7160EB'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACD/2BBD2191-BB12-3557-8D70-4B33544CA3E0/SFX/AutoCAD_2024_Korean_Win_64bit_dlm_002_002.sfx.exe'
$checksum2 = '5BAEC6B81D0D73FC8D6DFA04FA0B21064E344CEEC6A1D39F7231258AEF645D81'
}

elseif ($pp.'Polish') {
$packageName = 'AutoCAD_2024_Polish_Win_64bit_dlm'
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACD/D374645F-0162-318F-A4F2-9BF8240D3D23/SFX/AutoCAD_2024_Polish_Win_64bit_dlm_001_002.sfx.exe'
$checksum1 = '28E7AD3D2534B1EEDD9B4395C6ECA389E453F84D3FDFDB67CE2DA054D308721C'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACD/D374645F-0162-318F-A4F2-9BF8240D3D23/SFX/AutoCAD_2024_Polish_Win_64bit_dlm_002_002.sfx.exe'
$checksum2 = '302069A5B918A52DCF31C3DDA2674E8D03C470F9B5A8A6F49725AD28C41FA36D'
}

elseif ($pp.'Portuguese') {
$packageName = 'AutoCAD_2024_Brazilian_Portuguese_Win_64bit_dlm'
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACD/19B7E69F-3FAD-3EEC-BB19-49AD6050E01A/SFX/AutoCAD_2024_Brazilian_Portuguese_Win_64bit_dlm_001_002.sfx.exe'
$checksum1 = '648C615EEB5FFD04B151029F52E9DD1782849AED9B4E3322F0E238278AA7DF75'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACD/19B7E69F-3FAD-3EEC-BB19-49AD6050E01A/SFX/AutoCAD_2024_Brazilian_Portuguese_Win_64bit_dlm_002_002.sfx.exe'
$checksum2 = '29A75B9DF99B81FB0B2BDA65C2091042CAB50F6590E350BD6EF7022134A819FB'
}

elseif ($pp.'Russian') {
$packageName = 'AutoCAD_2024_Russian_Win_64bit_dlm'
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACD/995E0303-033E-3B35-B128-E01E5F4122DF/SFX/AutoCAD_2024_Russian_Win_64bit_dlm_001_002.sfx.exe'
$checksum1 = '78ACDAD4F4249A8E34399D4BA2D304D064E6B782C44C14D9DF964CBB6B0012D3'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACD/995E0303-033E-3B35-B128-E01E5F4122DF/SFX/AutoCAD_2024_Russian_Win_64bit_dlm_002_002.sfx.exe'
$checksum2 = 'DD97E3D6DB1A03A69CC4C1D853C8EEB1364BCDFE459A52890259F3B04E28A503'
}

elseif ($pp.'Spanish') {
$packageName = 'AutoCAD_2024_Spanish_Win_64bit_dlm'
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACD/B0C7C531-7513-3604-A5E9-51EAE2517EFC/SFX/AutoCAD_2024_Spanish_Win_64bit_dlm_001_002.sfx.exe'
$checksum1 = '28A56110AD370089CC9F6210C2A0022EE6C0C3D4FED6F069A702EC9CC56E5ED7'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACD/B0C7C531-7513-3604-A5E9-51EAE2517EFC/SFX/AutoCAD_2024_Spanish_Win_64bit_dlm_002_002.sfx.exe'
$checksum2 = 'DB0D56192405BA09F6BAF290B025EF17F5923463DE1898F506E97835A13EA54C'
}

else {
$packageName = 'AutoCAD_2024_English_Win_64bit_dlm'
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACD/CC46AD7F-5075-3702-B2BF-CFCC5AB8468B/SFX/AutoCAD_2024_English_Win_64bit_dlm_001_002.sfx.exe'
$checksum1 = 'C881C55603BAD590126FC0FAE380D87F039140E290DE6DDDABF72722CF64BC8B'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/2024/ACD/CC46AD7F-5075-3702-B2BF-CFCC5AB8468B/SFX/AutoCAD_2024_English_Win_64bit_dlm_002_002.sfx.exe'
$checksum2 = 'AA15E50232B467C71BFD4B367C8A4574C5D21BADE83209FD12AFB6E04B399CB6'
}

#DOWNLOAD
$temp = Join-Path $env:TEMP $packageName
$part1 = $temp + '_001_002.sfx.exe'
$part2 = $temp + '_002_002.sfx.exe'
$file = Join-Path $temp 'Setup.exe'
Get-ChocolateyWebFile -PackageName 'AutoCAD Download Part 1' -FileFullPath $part1 -Url $url1 -Checksum $checksum1 -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'AutoCAD Download Part 2' -FileFullPath $part2 -Url $url2 -Checksum $checksum2 -ChecksumType 'sha256'

#EXTRACT
$packageArgsUnzip  = @{
  packageName    = 'AutoCAD Installation Files'
  fileType       = 'exe'
  file           = $part1
  softwareName   = 'AutoCAD Installation Files*'
  silentArgs     = "-suppresslaunch -d $env:TEMP"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgsUnzip

#INSTALL
$packageArgs  = @{
  packageName    = 'AutoCAD'
  fileType       = 'exe'
  file           = $file
  softwareName   = 'AutoCAD*'
  silentArgs     = '-q'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgs
