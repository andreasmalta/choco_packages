$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


#CHECK IF ALREADY INSTALLED
$regkey = Get-ItemProperty -Path hklm:software\microsoft\windows\currentversion\policies\system -Name "EnableLUA"
if($regkey.DisplayName -ne 'Inventor View 2023')
{
 set-itemproperty -Path hklm:software\microsoft\windows\currentversion\policies\system -Name "EnableLUA" -value 0
}


#UNINSTALL OLD VERSIONS
. $toolsDir\helpers.ps1
Invoke-UninstallOld


#INSTALLATION SETTINGS
$pp = Get-PackageParameters

if ($pp.'ChineseSimp') {
$url = 'https://download.autodesk.com/akn/2023/inventor_view/inventor_view_2023_simplified_chinese_win_64bit_dlm.sfx.exe'
$checksum = '523AA1F3B7C41E539DF09E7586BA480EE2BF457A83D304019513E6B7DB15170E'
$file = Join-Path $env:TEMP 'inventor_view_2023_simplified_chinese_win_64bit_dlm\setup.exe'
}

elseif ($pp.'ChineseTrad') {
$url = 'https://download.autodesk.com/akn/2023/inventor_view/inventor_view_2023_traditional_chinese_win_64bit_dlm.sfx.exe'
$checksum = 'BDA8CA810DF4874F8E4C0EF4C0D43C1EB3CBE2C759A615F4D9C75F92816C03C4'
$file = Join-Path $env:TEMP 'inventor_view_2023_traditional_chinese_win_64bit_dlm\setup.exe'
}

elseif ($pp.'Czech') {
$url = 'https://download.autodesk.com/akn/2023/inventor_view/inventor_view_2023_czech_win_64bit_dlm.sfx.exe'
$checksum = 'B362B8A9A4E48A537701BAFB778FF7E12486581183D63D7AC5280E8D19EA838E'
$file = Join-Path $env:TEMP 'inventor_view_2023_czech_win_64bit_dlm\setup.exe'
}

elseif ($pp.'French') {
$url = 'https://download.autodesk.com/akn/2023/inventor_view/inventor_view_2023_french_win_64bit_dlm.sfx.exe'
$checksum = 'BDED77DAF9135BAB840E7D9843132326B49E278E8D2BC6FF422F15D089182069'
$file = Join-Path $env:TEMP 'inventor_view_2023_french_win_64bit_dlm\setup.exe'
}

elseif ($pp.'German') {
$url = 'https://download.autodesk.com/akn/2023/inventor_view/inventor_view_2023_german_win_64bit_dlm.sfx.exe'
$checksum = '1CC3D720F2DA7EC06A7F38F7BD74734BB4266B589EA844A4D512F35FFAF4F03C'
$file = Join-Path $env:TEMP 'inventor_view_2023_german_win_64bit_dlm\setup.exe'
}

elseif ($pp.'Italian') {
$url = 'https://download.autodesk.com/akn/2023/inventor_view/inventor_view_2023_italian_win_64bit_dlm.sfx.exe'
$checksum = '83025A75CE6F26D2A96D8902AB75391CA3A7E5A8EBE07F24F958C57131D7A478'
$file = Join-Path $env:TEMP 'inventor_view_2023_italian_win_64bit_dlm\setup.exe'
}

elseif ($pp.'Japanese') {
$url = 'https://download.autodesk.com/akn/2023/inventor_view/inventor_view_2023_japanese_win_64bit_dlm.sfx.exe'
$checksum = 'EECFDF72DC95FCAE40589412B377C9BB4F5CF2671AD3085203937385D693CE9E'
$file = Join-Path $env:TEMP 'inventor_view_2023_japanese_win_64bit_dlm\setup.exe'
}

elseif ($pp.'Korean') {
$url = 'https://download.autodesk.com/akn/2023/inventor_view/inventor_view_2023_korean_win_64bit_dlm.sfx.exe'
$checksum = 'C7FB940A148D32C449D7B9673B63C994A6D77F601BDBB3747E919CDBFF3FA7DA'
$file = Join-Path $env:TEMP 'inventor_view_2023_korean_win_64bit_dlm\setup.exe'
}

elseif ($pp.'Polish') {
$url = 'https://download.autodesk.com/akn/2023/inventor_view/inventor_view_2023_polish_win_64bit_dlm.sfx.exe'
$checksum = '9503C66BD90A504CBC9DE28919E2C971D0FCAB0BCA67649962A742FB93AA5EA6'
$file = Join-Path $env:TEMP 'inventor_view_2023_polish_win_64bit_dlm\setup.exe'
}

elseif ($pp.'Portuguese') {
$url = 'https://download.autodesk.com/akn/2023/inventor_view/inventor_view_2023_portuguese_brazil_win_64bit_dlm.sfx.exe'
$checksum = 'ECA4A1B54A5B591B241486E571A68EECB39CA0E19B1888CCCE0D0BC9BEED4863'
$file = Join-Path $env:TEMP 'inventor_view_2023_portuguese_brazil_win_64bit_dlm\setup.exe'
}

elseif ($pp.'Russian') {
$url = 'https://download.autodesk.com/akn/2023/inventor_view/inventor_view_2023_russian_win_64bit_dlm.sfx.exe'
$checksum = '46797333069683EF55C10BF22436BD6C1B009E52E979B0AAD3FD7A9E9CCD3DA7'
$file = Join-Path $env:TEMP 'inventor_view_2023_russian_win_64bit_dlm\setup.exe'
}

elseif ($pp.'Spanish') {
$url = 'https://download.autodesk.com/akn/2023/inventor_view/inventor_view_2023_spanish_win_64bit_dlm.sfx.exe'
$checksum = '86F5EC661619F9067EBDBAC43C08CBFCCDF704EF4313B5DC115A19CD41024A0E'
$file = Join-Path $env:TEMP 'inventor_view_2023_spanish_win_64bit_dlm\setup.exe'
}

else {
$url = 'https://download.autodesk.com/akn/2023/inventor_view/inventor_view_2023_english_win_64bit_dlm.sfx.exe'
$checksum = '7212192A99150BB2F1F47839F8499DE289389B25C2D71218642E233162103FE3'
$file = Join-Path $env:TEMP 'inventor_view_2023_english_win_64bit_dlm\Setup.exe'
}

$packageArgsUnzip = @{
  packageName    = 'Inventor View Installation Files'
  fileType       = 'exe'
  url            = $url
  softwareName   = 'Inventor View Installation Files*'
  checksum       = $checksum
  checksumType   = 'sha256'
  silentArgs     = "-suppresslaunch -d $env:TEMP"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgsUnzip

$packageArgs  = @{
  packageName    = 'Inventor View'
  fileType       = 'exe'
  file           = $file
  softwareName   = 'Inventor View*'
  silentArgs     = '-q'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgs
