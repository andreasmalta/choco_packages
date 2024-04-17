$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#1 LANGUAGE SELECTION
$pp = Get-PackageParameters
if ($pp.'ChineseSimp') {
$url1 = 'https://efulfillment.autodesk.com'
$checksum1 = 'xxxxx'
$file = $env:TEMP + '\xxxx.exe'
$url2 = 'https://efulfillment.autodesk.com'
$checksum2 = 'xxxxx'
$zip = $env:TEMP + '\xxxx.7z'
}

elseif ($pp.'ChineseTrad') {
$url1 = 'https://efulfillment.autodesk.com'
$checksum1 = 'xxxxx'
$file = $env:TEMP + '\xxxx.exe'
$url2 = 'https://efulfillment.autodesk.com'
$checksum2 = 'xxxxx'
$zip = $env:TEMP + '\xxxx.7z'
}

elseif ($pp.'Czech') {
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACDLT/85B4D741-F0A9-39BB-A7EC-1BD95E9AFD69/SFX/AutoCAD_LT_2025_Czech_Win_64bit_db_001_002.exe'
$checksum1 = 'CD2A3285E6AB0DFAE3C585EAD6DA3C5D6A70DEB961B4C5F0B33D0AA9800E754B'
$file = $env:TEMP + '\AutoCAD_LT_2025_Czech_Win_64bit_db_001_002.exe'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACDLT/85B4D741-F0A9-39BB-A7EC-1BD95E9AFD69/SFX/AutoCAD_LT_2025_Czech_Win_64bit_db_002_002.7z'
$checksum2 = '8844F6002B959677CCEB9B0CA2AEA22EEB3413D763C3109173ED458AD5BDD01C'
$zip = $env:TEMP + '\AutoCAD_LT_2025_Czech_Win_64bit_db_002_002.7z'
}

elseif ($pp.'French') {
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACDLT/34CA0569-31A2-3449-8671-96146F71269F/SFX/AutoCAD_LT_2025_French_Win_64bit_db_001_002.exe'
$checksum1 = '99A7D816240DFFAF80734827A42DB42ABFC86F8FC63A7CD03BA65ECC91E18668'
$file = $env:TEMP + '\AutoCAD_LT_2025_French_Win_64bit_db_001_002.exe'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACDLT/34CA0569-31A2-3449-8671-96146F71269F/SFX/AutoCAD_LT_2025_French_Win_64bit_db_002_002.7z'
$checksum2 = '7C45143325232D5E3E2D19325A673F0338F052DB575B8842F567221A26781113'
$zip = $env:TEMP + '\AutoCAD_LT_2025_French_Win_64bit_db_002_002.7z'
}

elseif ($pp.'German') {
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACDLT/151FEF20-19EA-3913-8212-4DB7FCDBE169/SFX/AutoCAD_LT_2025_German_Win_64bit_db_001_002.exe'
$checksum1 = '1CD46A766E3B7BD6CB0965BB673177D320AA21748E71F67FA66E58D63D469055'
$file = $env:TEMP + '\AutoCAD_LT_2025_German_Win_64bit_db_001_002.exe'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACDLT/151FEF20-19EA-3913-8212-4DB7FCDBE169/SFX/AutoCAD_LT_2025_German_Win_64bit_db_002_002.7z'
$checksum2 = '5F4AA4E25490206614D15F2FD209B675336D7AB9FCF72DE3C727819C3280FE11'
$zip = $env:TEMP + '\AutoCAD_LT_2025_German_Win_64bit_db_002_002.7z'
}

elseif ($pp.'Hungarian') {
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACDLT/92270647-D00C-31EA-9A32-A3E9D267FDCA/SFX/AutoCAD_LT_2025_Hungarian_Win_64bit_db_001_002.exe'
$checksum1 = '04DB3B86FCAA8D0FF38A2D38D8F1AB346E2A9DE21F6161C4E72AB187D18FAD92'
$file = $env:TEMP + '\AutoCAD_LT_2025_Hungarian_Win_64bit_db_001_002.exe'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACDLT/92270647-D00C-31EA-9A32-A3E9D267FDCA/SFX/AutoCAD_LT_2025_Hungarian_Win_64bit_db_002_002.7z'
$checksum2 = '2F3A0FAA727CAB409578E41C7D9551900266A4206A7C8D6FFF265A64DC180991'
$zip = $env:TEMP + '\AutoCAD_LT_2025_Hungarian_Win_64bit_db_002_002.7z'
}

elseif ($pp.'Italian') {
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACDLT/92A0CA8D-DAF1-3985-9C30-81441D4A219D/SFX/AutoCAD_LT_2025_Italian_Win_64bit_db_001_002.exe'
$checksum1 = '678CBC19AE594BA8101232CAC0D867F32F69552A99D3185DA4291EE27A415068'
$file = $env:TEMP + '\AutoCAD_LT_2025_Italian_Win_64bit_db_001_002.exe'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACDLT/92A0CA8D-DAF1-3985-9C30-81441D4A219D/SFX/AutoCAD_LT_2025_Italian_Win_64bit_db_002_002.7z'
$checksum2 = '9456DDE2418F1A9311741BD603A0FCDFA2E736163D938D394F5F145C55CE1A32'
$zip = $env:TEMP + '\AutoCAD_LT_2025_Italian_Win_64bit_db_002_002.7z'
}

elseif ($pp.'Japanese') {
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACDLT/ACCDC080-BC65-3F0E-83C8-903B901B6768/SFX/AutoCAD_LT_2025_Japanese_Win_64bit_db_001_002.exe'
$checksum1 = '39435609654BDD2A9B801E5793D6E5419B1280DA1BC87B7A3AF98D24272D386B'
$file = $env:TEMP + '\AutoCAD_LT_2025_Japanese_Win_64bit_db_001_002.exe'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACDLT/ACCDC080-BC65-3F0E-83C8-903B901B6768/SFX/AutoCAD_LT_2025_Japanese_Win_64bit_db_002_002.7z'
$checksum2 = '369787CDC5C6B6BF2764D5CC4AB3EC19EED21291B3030E61A992F5B69E567520'
$zip = $env:TEMP + '\AutoCAD_LT_2025_Japanese_Win_64bit_db_002_002.7z'
}

elseif ($pp.'Korean') {
$url1 = 'https://efulfillment.autodesk.com'
$checksum1 = 'xxxxx'
$file = $env:TEMP + '\xxxx.exe'
$url2 = 'https://efulfillment.autodesk.com'
$checksum2 = 'xxxxx'
$zip = $env:TEMP + '\xxxx.7z'
}

elseif ($pp.'Polish') {
$url1 = 'https://efulfillment.autodesk.com'
$checksum1 = 'xxxxx'
$file = $env:TEMP + '\xxxx.exe'
$url2 = 'https://efulfillment.autodesk.com'
$checksum2 = 'xxxxx'
$zip = $env:TEMP + '\xxxx.7z'
}

elseif ($pp.'Portuguese') {
$url1 = 'https://efulfillment.autodesk.com'
$checksum1 = 'xxxxx'
$file = $env:TEMP + '\xxxx.exe'
$url2 = 'https://efulfillment.autodesk.com'
$checksum2 = 'xxxxx'
$zip = $env:TEMP + '\xxxx.7z'
}

elseif ($pp.'Russian') {
$url1 = 'https://efulfillment.autodesk.com'
$checksum1 = 'xxxxx'
$file = $env:TEMP + '\xxxx.exe'
$url2 = 'https://efulfillment.autodesk.com'
$checksum2 = 'xxxxx'
$zip = $env:TEMP + '\xxxx.7z'
}

elseif ($pp.'Spanish') {
$url1 = 'https://efulfillment.autodesk.com'
$checksum1 = 'xxxxx'
$file = $env:TEMP + '\xxxx.exe'
$url2 = 'https://efulfillment.autodesk.com'
$checksum2 = 'xxxxx'
$zip = $env:TEMP + '\xxxx.7z'
}

else {
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACDLT/5F84131A-A029-32CD-ADF6-66AC3C051E93/SFX/AutoCAD_LT_2025_English_Win_64bit_db_001_002.exe'
$checksum1 = '950DEA4DD6504616D3C5A7D7482963D460EF1AEA195B9C5FAFEE2BEBCB7EBB82'
$file = $env:TEMP + '\AutoCAD_LT_2025_English_Win_64bit_db_001_002.exe'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACDLT/5F84131A-A029-32CD-ADF6-66AC3C051E93/SFX/AutoCAD_LT_2025_English_Win_64bit_db_002_002.7z'
$checksum2 = 'E4E9054879ABD7BFF9BE91672841CD32263E19263ED3B2861BBE77B3E22C5078'
$zip = $env:TEMP + '\AutoCAD_LT_2025_English_Win_64bit_db_002_002.7z'
}

#2 DOWNLOAD
Get-ChocolateyWebFile -PackageName 'EXE package' -FileFullPath $file -Url $url1 -Checksum $checksum1 -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'ZIP package' -FileFullPath $zip -Url $url2 -Checksum $checksum2 -ChecksumType 'sha256'

#3 UNINSTALL OLD
. $toolsDir\helpers.ps1
Invoke-UninstallOld

#4 INSTALL
$packageArgs  = @{
  packageName    = 'AutoCAD LT'
  fileType       = 'exe'
  file           = $file
  softwareName   = 'AutoCAD LT*'
  silentArgs     = '-q'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgs
