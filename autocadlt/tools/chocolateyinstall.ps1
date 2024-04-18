$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#1 LANGUAGE SELECTION
$pp = Get-PackageParameters
if ($pp.'ChineseSimp') {
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACDLT/52A709C6-73F2-35D7-A5F6-D219D5A1079E/SFX/AutoCAD_LT_2025_Simplified_Chinese_Win_64bit_db_001_002.exe'
$checksum1 = 'BC521215F0169D780EDF7C2D9F3F70DF0D337AAC5B390EBE2F80C9C4E0AC09F1'
$file = $env:TEMP + '\AutoCAD_LT_2025_Simplified_Chinese_Win_64bit_db_001_002.exe'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACDLT/52A709C6-73F2-35D7-A5F6-D219D5A1079E/SFX/AutoCAD_LT_2025_Simplified_Chinese_Win_64bit_db_002_002.7z'
$checksum2 = 'BFC1C7903C612F3E6C20F718D56B1F31240CBF3CA92442DE984E26B42BE6E9E6'
$zip = $env:TEMP + '\AutoCAD_LT_2025_Simplified_Chinese_Win_64bit_db_002_002.7z'
}

elseif ($pp.'ChineseTrad') {
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACDLT/CA6AA7E3-FE15-3F16-A82D-C7DB961FEE58/SFX/AutoCAD_LT_2025_Traditional_Chinese_Win_64bit_db_001_002.exe'
$checksum1 = 'F141248DFD8597D1D07E10B47E6E71AF9BC9FF73E7598F70ADC211F423FF5019'
$file = $env:TEMP + '\AutoCAD_LT_2025_Traditional_Chinese_Win_64bit_db_001_002.exe'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACDLT/CA6AA7E3-FE15-3F16-A82D-C7DB961FEE58/SFX/AutoCAD_LT_2025_Traditional_Chinese_Win_64bit_db_002_002.7z'
$checksum2 = '12CB7802D836BE4E9C7F9224B240EC22678933FC4DC690D119BAF27DC95E5BE6'
$zip = $env:TEMP + '\AutoCAD_LT_2025_Traditional_Chinese_Win_64bit_db_002_002.7z'
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
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACDLT/DB6A0DA8-2768-314F-92DB-A40FAAD7036A/SFX/AutoCAD_LT_2025_Korean_Win_64bit_db_001_002.exe'
$checksum1 = '1DC78D76B9B10AF3920D5DA4DE58B1F5313E9C34EF9ECA07B9F3E4CAB4078B55'
$file = $env:TEMP + '\AutoCAD_LT_2025_Korean_Win_64bit_db_001_002.exe'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACDLT/DB6A0DA8-2768-314F-92DB-A40FAAD7036A/SFX/AutoCAD_LT_2025_Korean_Win_64bit_db_002_002.7z'
$checksum2 = '1A0F78FAF24F4C656274F92AB5F6A5C00D30DE8B9AD887FFBF7270A23B8E354D'
$zip = $env:TEMP + '\AutoCAD_LT_2025_Korean_Win_64bit_db_002_002.7z'
}

elseif ($pp.'Polish') {
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACDLT/2FA1F611-22BA-334D-BAAD-C1729A1CF28A/SFX/AutoCAD_LT_2025_Polish_Win_64bit_db_001_002.exe'
$checksum1 = 'FDE66D25DBBC1EC9EDD3623B4C0F7CB2C60D22A6AEE62D9901090D1653C882BE'
$file = $env:TEMP + '\AutoCAD_LT_2025_Polish_Win_64bit_db_001_002.exe'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACDLT/2FA1F611-22BA-334D-BAAD-C1729A1CF28A/SFX/AutoCAD_LT_2025_Polish_Win_64bit_db_002_002.7z'
$checksum2 = 'D45DC88B1D77C3BF7405AEEEA4E938DB652612A023B61B4082E6A048AB882FBC'
$zip = $env:TEMP + '\AutoCAD_LT_2025_Polish_Win_64bit_db_002_002.7z'
}

elseif ($pp.'Portuguese') {
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACDLT/336838AD-BE91-3FD2-9012-F829AD7CCCFD/SFX/AutoCAD_LT_2025_Brazilian_Portuguese_Win_64bit_db_001_002.exe'
$checksum1 = 'FD1092DD6EB2A622BB61BB878269ED1E25E1E9E79C21919E17BD7B2ADB04B7F0'
$file = $env:TEMP + '\AutoCAD_LT_2025_Brazilian_Portuguese_Win_64bit_db_001_002.exe'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACDLT/336838AD-BE91-3FD2-9012-F829AD7CCCFD/SFX/AutoCAD_LT_2025_Brazilian_Portuguese_Win_64bit_db_002_002.7z'
$checksum2 = '7C06F5AC2D31919CDF222E49079FB725EC58F1D6730E965F0432098841DB84A7'
$zip = $env:TEMP + '\AutoCAD_LT_2025_Brazilian_Portuguese_Win_64bit_db_002_002.7z'
}

elseif ($pp.'Russian') {
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACDLT/9975DC29-376C-32AD-B24B-334D8226EB51/SFX/AutoCAD_LT_2025_Russian_Win_64bit_db_001_002.exe'
$checksum1 = '1E4AC16CEC561A7945FE5171FFA9A37DDC3037891BED4E6133F11BB31A7ED83B'
$file = $env:TEMP + '\AutoCAD_LT_2025_Russian_Win_64bit_db_001_002.exe'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACDLT/9975DC29-376C-32AD-B24B-334D8226EB51/SFX/AutoCAD_LT_2025_Russian_Win_64bit_db_002_002.7z'
$checksum2 = '8C1E6B5E336D171D58DA2D1345731EF95375F6D926A5F9ACF7474F30D26E3A9C'
$zip = $env:TEMP + '\AutoCAD_LT_2025_Russian_Win_64bit_db_002_002.7z'
}

elseif ($pp.'Spanish') {
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACDLT/63831215-9D21-3A39-BFBF-F8BA1A6DB083/SFX/AutoCAD_LT_2025_Spanish_Win_64bit_db_001_002.exe'
$checksum1 = '0FEB917620F925E9ECB2E3C6175F7D9DFC15457C6D80EB9C6E70337CD6509E2E'
$file = $env:TEMP + '\AutoCAD_LT_2025_Spanish_Win_64bit_db_001_002.exe'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACDLT/63831215-9D21-3A39-BFBF-F8BA1A6DB083/SFX/AutoCAD_LT_2025_Spanish_Win_64bit_db_002_002.7z'
$checksum2 = 'ED26071457368EB17B4DA7D2137175CA179326E67118A3E6374115ABE4EDA57A'
$zip = $env:TEMP + '\AutoCAD_LT_2025_Spanish_Win_64bit_db_002_002.7z'
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
