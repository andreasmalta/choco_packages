$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#1 LANGUAGE SELECTION
$pp = Get-PackageParameters
if ($pp.'French') {
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/PLC0000037/0F8A47A4-5472-3C4A-BCA7-2DD7B5087450/SFX/DWGTrueView_2025_French_64bit_db_001_002.exe'
$checksum1 = '8C4EEBA965EF2BC84939DF80BE157D9D6DFBE4384B696B0BEFD99B2D35C349C5'
$file = $env:TEMP + '\DWGTrueView_2025_French_64bit_db_001_002.exe'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/PLC0000037/0F8A47A4-5472-3C4A-BCA7-2DD7B5087450/SFX/DWGTrueView_2025_French_64bit_db_002_002.7z'
$checksum2 = '7138AE3201E2E7A7F29DF752661990FC1B0627404A9C1B9FE040D1353534846A'
$zip = $env:TEMP + '\DWGTrueView_2025_French_64bit_db_002_002.7z'
}

elseif ($pp.'Japanese') {
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/PLC0000037/66C61B31-687C-3B6F-A4AE-777273EB4AD2/SFX/DWGTrueView_2025_Japanese_64bit_db_001_002.exe'
$checksum1 = 'F4062187DD403A42703D679588B9F868BDB603D8F4DA1A160931E55F17CA96C9'
$file = $env:TEMP + '\DWGTrueView_2025_Japanese_64bit_db_001_002.exe'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/PLC0000037/66C61B31-687C-3B6F-A4AE-777273EB4AD2/SFX/DWGTrueView_2025_Japanese_64bit_db_002_002.7z'
$checksum2 = 'DA41ACFB1FD0426B8875F5EEAA239E213726548E7458943EAB4BCB15C871F6F2'
$zip = $env:TEMP + '\DWGTrueView_2025_Japanese_64bit_db_002_002.7z'
}

else {
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/PLC0000037/A6C769F8-A5A7-3306-9711-0E6F4C045BA2/SFX/DWGTrueView_2025_English_64bit_db_001_002.exe'
$checksum1 = '56B5B5988719AC14A8644EE1AA82D79576842C09D5F71BBBC450C3E28FFAA99B'
$file = $env:TEMP + '\DWGTrueView_2025_English_64bit_db_001_002.exe'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2025/PLC0000037/A6C769F8-A5A7-3306-9711-0E6F4C045BA2/SFX/DWGTrueView_2025_English_64bit_db_002_002.7z'
$checksum2 = 'B487729B8B7A2FEA46085F6BC889312D0F53F32D243351FF8CB4893DCEE72066'
$zip = $env:TEMP + '\DWGTrueView_2025_English_64bit_db_002_002.7z'
}

#2 DOWNLOAD
Get-ChocolateyWebFile -PackageName 'EXE package' -FileFullPath $file -Url $url1 -Checksum $checksum1 -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'ZIP package' -FileFullPath $zip -Url $url2 -Checksum $checksum2 -ChecksumType 'sha256'

#3 UNINSTALL OLD
. $toolsDir\helpers.ps1
Invoke-UninstallDWGTrueView

#4 INSTALL
$packageArgs  = @{
  packageName    = 'DWG TrueView'
  fileType       = 'exe'
  file           = $file
  softwareName   = 'DWG TrueView*'
  silentArgs     = '-q'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgs
