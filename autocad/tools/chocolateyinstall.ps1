$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#1 LANGUAGE SELECTION
$pp = Get-PackageParameters
if ($pp.'ChineseSimp') {
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACD/7B66591E-A260-34D2-B2AD-8FDC4EA76CE8/SFX/AutoCAD_2025_Simplified_Chinese_Win_64bit_db_001_002.exe'
$checksum1 = '4F4CED484E51BDE67382F4A7B91EA9D260E9E5E1522E7DF01D84A05CDC8C87B0'
$file = $env:TEMP + '\AutoCAD_2025_Simplified_Chinese_Win_64bit_db_001_002.exe'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACD/7B66591E-A260-34D2-B2AD-8FDC4EA76CE8/SFX/AutoCAD_2025_Simplified_Chinese_Win_64bit_db_002_002.7z'
$checksum2 = '69562C87F41477DF988A6C111119F6EDD5CCCAE1B0BA4DAB03261B92863FC3B2'
$zip = $env:TEMP + '\AutoCAD_2025_Simplified_Chinese_Win_64bit_db_002_002.7z'
}

elseif ($pp.'ChineseTrad') {
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACD/51DF6195-54FE-35DC-B7E1-2FF767474517/SFX/AutoCAD_2025_Traditional_Chinese_Win_64bit_db_001_002.exe'
$checksum1 = '8A192545663F730B8B66E15BE13A5D82B91FC14EF80423F104FB7A98DBC1A342'
$file = $env:TEMP + '\AutoCAD_2025_Traditional_Chinese_Win_64bit_db_001_002.exe'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACD/51DF6195-54FE-35DC-B7E1-2FF767474517/SFX/AutoCAD_2025_Traditional_Chinese_Win_64bit_db_002_002.7z'
$checksum2 = '2020ECBBA713021C991D3527D41752391B87E5182D668A591FC05DCC79998798'
$zip = $env:TEMP + '\AutoCAD_2025_Traditional_Chinese_Win_64bit_db_002_002.7z'
}

elseif ($pp.'Czech') {
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACD/465CAD61-E25B-3B6F-9E5D-372AC3036356/SFX/AutoCAD_2025_Czech_Win_64bit_db_001_002.exe'
$checksum1 = 'BD3CDDA10EB0CF74FBAC4EC7BABACCA24BCC498A4DD236046B10FB654E406085'
$file = $env:TEMP + '\AutoCAD_2025_Czech_Win_64bit_db_001_002.exe'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACD/465CAD61-E25B-3B6F-9E5D-372AC3036356/SFX/AutoCAD_2025_Czech_Win_64bit_db_002_002.7z'
$checksum2 = '682DE6A62372B5C949CDA28120DDF3937A4C1EFF2F4F4B95EA9B9478F5621A31'
$zip = $env:TEMP + '\AutoCAD_2025_Czech_Win_64bit_db_002_002.7z'
}

elseif ($pp.'French') {
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACD/14748722-BFE6-3CCD-9049-D34DE0D1F387/SFX/AutoCAD_2025_French_Win_64bit_db_001_002.exe'
$checksum1 = '8CA7BDC7928758EF36B905CE7FE43191EB88B546163D6BEF028E217548E05448'
$file = $env:TEMP + '\AutoCAD_2025_French_Win_64bit_db_001_002.exe'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACD/14748722-BFE6-3CCD-9049-D34DE0D1F387/SFX/AutoCAD_2025_French_Win_64bit_db_002_002.7z'
$checksum2 = '4D15E9114A3A232844F81B87F6174BE469B75D12CCB2ADAF4830E9232F3CB7B3'
$zip = $env:TEMP + '\AutoCAD_2025_French_Win_64bit_db_002_002.7z'
}

elseif ($pp.'German') {
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACD/98F6F024-5791-33B5-9DAD-D6A1178CB07F/SFX/AutoCAD_2025_German_Win_64bit_db_001_002.exe'
$checksum1 = '3B0887E8CBBD1EE2A10BF2ED07AFBD4ABD8734E38804B6578EB84BD43C624FC6'
$file = $env:TEMP + '\AutoCAD_2025_German_Win_64bit_db_001_002.exe'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACD/98F6F024-5791-33B5-9DAD-D6A1178CB07F/SFX/AutoCAD_2025_German_Win_64bit_db_002_002.7z'
$checksum2 = '4E56859E0B7A5B12F981653C50C25A1007C94ABC5CFBE375D6D8AFEF3DEEAD5B'
$zip = $env:TEMP + '\AutoCAD_2025_German_Win_64bit_db_002_002.7z'
}

elseif ($pp.'Hungarian') {
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACD/399CB949-4AB0-327D-9282-97F89D74DFE3/SFX/AutoCAD_2025_Hungarian_Win_64bit_db_001_002.exe'
$checksum1 = '882756C46F75E1DDA059CAB12241AD3E78968F1A62C916456F57ACA649B8D027'
$file = $env:TEMP + '\AutoCAD_2025_Hungarian_Win_64bit_db_001_002.exe'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACD/399CB949-4AB0-327D-9282-97F89D74DFE3/SFX/AutoCAD_2025_Hungarian_Win_64bit_db_002_002.7z'
$checksum2 = '742F345D4947F0F2C6D929D67A0064DBA94B3E8DE5925E92CA77455F66984090'
$zip = $env:TEMP + '\AutoCAD_2025_Hungarian_Win_64bit_db_002_002.7z'
}

elseif ($pp.'Italian') {
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACD/7EAC0FB5-66C9-394E-965A-BD140F4AF008/SFX/AutoCAD_2025_Italian_Win_64bit_db_001_002.exe'
$checksum1 = '322D5FBC58306D2E5F25609FCCB315E0C8B4D9E1784CF877CA23F3BD258ECCB2'
$file = $env:TEMP + '\AutoCAD_2025_Italian_Win_64bit_db_001_002.exe'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACD/7EAC0FB5-66C9-394E-965A-BD140F4AF008/SFX/AutoCAD_2025_Italian_Win_64bit_db_002_002.7z'
$checksum2 = '6FF3286E394423E267C68B8A2D5054BB9625E9AC330D9B17BB40B7F0BD71BFC9'
$zip = $env:TEMP + '\AutoCAD_2025_Italian_Win_64bit_db_002_002.7z'
}

elseif ($pp.'Japanese') {
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACD/210D0912-F46A-33A1-BAFE-AB33150EE849/SFX/AutoCAD_2025_Japanese_Win_64bit_db_001_002.exe'
$checksum1 = 'D5323A6EA77B721225EC468DFC9C0B84775D14A0C69F8E54B82357B0AA7FD718'
$file = $env:TEMP + '\AutoCAD_2025_Japanese_Win_64bit_db_001_002.exe'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACD/210D0912-F46A-33A1-BAFE-AB33150EE849/SFX/AutoCAD_2025_Japanese_Win_64bit_db_002_002.7z'
$checksum2 = '96B4D9E6A19425797368AD233F4300791ADCB12037B79EC66ACF5C65337DC29B'
$zip = $env:TEMP + '\AutoCAD_2025_Japanese_Win_64bit_db_002_002.7z'
}

elseif ($pp.'Korean') {
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACD/AD7BA8FA-5A1F-3433-9A7C-A9CFFF4015EB/SFX/AutoCAD_2025_Korean_Win_64bit_db_001_002.exe'
$checksum1 = 'E4FD69A7EAFA25109830EBB0B12B6993ADDFA37D85195354F36F5B694CA591D7'
$file = $env:TEMP + '\AutoCAD_2025_Korean_Win_64bit_db_001_002.exe'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACD/AD7BA8FA-5A1F-3433-9A7C-A9CFFF4015EB/SFX/AutoCAD_2025_Korean_Win_64bit_db_002_002.7z'
$checksum2 = '2D7410FBED7F8A5D2B9B5064435D1F7970044B9E4F308A36559DB209C0FCBDB3'
$zip = $env:TEMP + '\AutoCAD_2025_Korean_Win_64bit_db_002_002.7z'
}

elseif ($pp.'Polish') {
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACD/0242AADE-B66F-3F3F-ACA4-37F92FB1A464/SFX/AutoCAD_2025_Polish_Win_64bit_db_001_002.exe'
$checksum1 = 'F33BCCDC4448266B88605DECD7267C43137338B9EB9C185A9A5532C65BDB2CE7'
$file = $env:TEMP + '\AutoCAD_2025_Polish_Win_64bit_db_001_002.exe'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACD/0242AADE-B66F-3F3F-ACA4-37F92FB1A464/SFX/AutoCAD_2025_Polish_Win_64bit_db_002_002.7z'
$checksum2 = 'F838FC624C07300797B263325B482DD0429C6D5BE766F68DE6DD604C861AFF13'
$zip = $env:TEMP + '\AutoCAD_2025_Polish_Win_64bit_db_002_002.7z'
}

elseif ($pp.'Portuguese') {
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACD/417A1CB2-E5A5-37E8-ACD8-66AB52B5C9A3/SFX/AutoCAD_2025_Brazilian_Portuguese_Win_64bit_db_001_002.exe'
$checksum1 = 'A049B93C63790322FAD02AEB7A9CEF9BF2F7963DDBB4BBE450C389EDA69754BC'
$file = $env:TEMP + '\AutoCAD_2025_Brazilian_Portuguese_Win_64bit_db_001_002.exe'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACD/417A1CB2-E5A5-37E8-ACD8-66AB52B5C9A3/SFX/AutoCAD_2025_Brazilian_Portuguese_Win_64bit_db_002_002.7z'
$checksum2 = '97FE25B3BAAECD93946D5F739BEE9AE11EAA13A289473B1E7E0F17970DD56112'
$zip = $env:TEMP + '\AutoCAD_2025_Brazilian_Portuguese_Win_64bit_db_002_002.7z'
}

elseif ($pp.'Russian') {
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACD/AAE626C9-9A7A-3E13-901E-B62D68A4788D/SFX/AutoCAD_2025_Russian_Win_64bit_db_001_002.exe'
$checksum1 = 'F9D9DE2A866508CC82A86042E5DD58B4C3CA65286032AE15019EF952BE97DBC6'
$file = $env:TEMP + '\AutoCAD_2025_Russian_Win_64bit_db_001_002.exe'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACD/AAE626C9-9A7A-3E13-901E-B62D68A4788D/SFX/AutoCAD_2025_Russian_Win_64bit_db_002_002.7z'
$checksum2 = 'B714D7FD20AB0A4C944CADCA93C9258274200AAAE66B12CA6356279DFFE89710'
$zip = $env:TEMP + '\AutoCAD_2025_Russian_Win_64bit_db_002_002.7z'
}

elseif ($pp.'Spanish') {
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACD/BCB62D9B-14E0-3933-927C-4FA4BAFDA43B/SFX/AutoCAD_2025_Spanish_Win_64bit_db_001_002.exe'
$checksum1 = '5428C2D6F3430DF55097D1A346955D3B6942177AAE5CA0DEB3B3EB214EDE064A'
$file = $env:TEMP + '\AutoCAD_2025_Spanish_Win_64bit_db_001_002.exe'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACD/BCB62D9B-14E0-3933-927C-4FA4BAFDA43B/SFX/AutoCAD_2025_Spanish_Win_64bit_db_002_002.7z'
$checksum2 = '92463EF04541149187D074324E5008CD5BBE675E051B5864771EBB65C5EAE778'
$zip = $env:TEMP + '\AutoCAD_2025_Spanish_Win_64bit_db_002_002.7z'
}

else {
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACD/99E57530-7CC1-31F4-89E9-24175C7690C2/SFX/AutoCAD_2025_English_Win_64bit_db_001_002.exe'
$checksum1 = '85B060EFC5001092E6D6781F768C9A713DBBB3AB0D1A7DC9026ADADAEAF677BB'
$file = $env:TEMP + '\AutoCAD_2025_English_Win_64bit_db_001_002.exe'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/ACD/99E57530-7CC1-31F4-89E9-24175C7690C2/SFX/AutoCAD_2025_English_Win_64bit_db_002_002.7z'
$checksum2 = 'F53960E3AC1F8257B2F64262B51D7550E2504A659F031EB78A48124CBC97973A'
$zip = $env:TEMP + '\AutoCAD_2025_English_Win_64bit_db_002_002.7z'
}

#2 DOWNLOAD
Get-ChocolateyWebFile -PackageName 'EXE package' -FileFullPath $file -Url $url1 -Checksum $checksum1 -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'ZIP package' -FileFullPath $zip -Url $url2 -Checksum $checksum2 -ChecksumType 'sha256'

#3 UNINSTALL OLD
. $toolsDir\helpers.ps1
Invoke-UninstallAutoCAD

#4 INSTALL
$packageArgs  = @{
  packageName    = 'AutoCAD'
  fileType       = 'exe'
  file           = $file
  softwareName   = 'AutoCAD*'
  silentArgs     = '-q'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgs