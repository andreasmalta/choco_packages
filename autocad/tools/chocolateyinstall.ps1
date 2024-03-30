$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$downloadsPath = (New-Object -ComObject Shell.Application).Namespace('shell:Downloads').Self.Path

#UNINSTALL OLD VERSIONS
. $toolsDir\helpers.ps1
Invoke-UninstallAutoCAD

#EXTRACT AND INSTALL
$pp = Get-PackageParameters
if ($pp.'ChineseSimp') {
$url = 'https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage412277320981616.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_ACD_2025_Simplified_Chinese_WIN64.exe%22&'
$checksum = '2C14D866741CEB3147F3EB2DEBAF71F7F83AB2499486B520B7BFB792B7F8B79C'
$file = Join-Path $downloadsPath 'Autodesk\AutoCAD 2025 - (ZH)\Setup.exe'
}

elseif ($pp.'ChineseTrad') {
$url = 'https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage412304911795199.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_ACD_2025_Traditional_Chinese_WIN64.exe%22&'
$checksum = 'E5073828902B061089682EBAC9E42EA2F76F296431BC65CF3D9120A22A00B815'
$file = Join-Path $downloadsPath 'Autodesk\AutoCAD 2025 - (ZH)\Setup.exe'
}

elseif ($pp.'Czech') {
$url = 'https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage411920752682111.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_ACD_2025_Czech_WIN64.exe%22&'
$checksum = '9E2B243CA315F243C26DC85CDC8DA2783C49A2C74C4B5582893A1DF54AB2601D'
$file = Join-Path $downloadsPath 'Autodesk\AutoCAD 2025 - (CS)\Setup.exe'
}

elseif ($pp.'French') {
$url = 'https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage412108967610413.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_ACD_2025_French_WIN64.exe%22&'
$checksum = 'F9CD7473B0C44594D45FF46C630F4DF357907DEA20DBC9AEBE5DDC1EBA9CD9DF'
$file = Join-Path $downloadsPath 'Autodesk\AutoCAD 2025 - (FR)\Setup.exe'
}

elseif ($pp.'German') {
$url = 'https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage412177469479902.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_ACD_2025_German_WIN64.exe%22&'
$checksum = '49E39C3DC8FB648B9895FEDDEC4115218A6D03FD3012F88B87D5416F36CFDBD6'
$file = Join-Path $downloadsPath 'Autodesk\AutoCAD 2025 - (DE)\Setup.exe'
}

elseif ($pp.'Hungarian') {
$url = 'https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage412339456508443.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_ACD_2025_Hungarian_WIN64.exe%22&'
$checksum = 'DF0603A13EC1D7330831AD7F85DBF74BD97205197D99782635186E0E6CD1619C'
$file = Join-Path $downloadsPath 'Autodesk\AutoCAD 2025 - (DE)\Setup.exe'
}

elseif ($pp.'Italian') {
$url = 'https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage412166945483218.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_ACD_2025_Italian_WIN64.exe%22&'
$checksum = '0ADF30980C34DA733336977C40BAAB7F0EBB292DBF033701F81C3B504B32EC74'
$file = Join-Path $downloadsPath 'Autodesk\AutoCAD 2025 - (IT)\Setup.exe'
}

elseif ($pp.'Japanese') {
$url = 'https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage412368082562462.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_ACD_2025_Japanese_WIN64.exe%22&'
$checksum = '490405C8A9FA6A4F91471BA76555B01E0F2F61D0DF28AD8ABB9AEF733F7410A1'
$file = Join-Path $downloadsPath 'Autodesk\AutoCAD 2025 - (JA)\Setup.exe'
}

elseif ($pp.'Korean') {
$url = 'https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage412200222529422.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_ACD_2025_Korean_WIN64.exe%22&'
$checksum = 'AE218BABE97EB929AE6EEAB8EBAD07E8A46BB26D008A4F5E08A61BA56D959C78'
$file = Join-Path $downloadsPath 'Autodesk\AutoCAD 2025 - (KO)\Setup.exe'
}

elseif ($pp.'Polish') {
$url = 'https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage412226509680749.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_ACD_2025_Polish_WIN64.exe%22&'
$checksum = '35F33F45AF0CC7475CA09D875999074AF3EC3A35B95D771B3517E265FB48FF92'
$file = Join-Path $downloadsPath 'Autodesk\AutoCAD 2025 - (PL)\Setup.exe'
}

elseif ($pp.'Portuguese') {
$url = 'https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage412249721924116.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_ACD_2025_Portuguese_WIN64.exe%22&'
$checksum = '6DDF8982F172DAA0A08CAE6A1164192FF67A856A9022EF0556BF10826FABF05E'
$file = Join-Path $downloadsPath 'Autodesk\AutoCAD 2025 - (PT)\Setup.exe'
}

elseif ($pp.'Russian') {
$url = 'https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage412248669670727.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_ACD_2025_Russian_WIN64.exe%22&'
$checksum = '0021B7310AF3D269ED235B8F18A5B999EC01BD203156A599D0889004E1CB3F82'
$file = Join-Path $downloadsPath 'Autodesk\AutoCAD 2025 - (RU)\Setup.exe'
}

elseif ($pp.'Spanish') {
$url = 'https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage412318235239630.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_ACD_2025_Spanish_WIN64.exe%22&'
$checksum = 'F4CF4909952D7514608A44B5A6E7BA75B9381DB6B191DDE6B1C6D4C7590F2F59'
$file = Join-Path $downloadsPath 'Autodesk\AutoCAD 2025 - (ES)\Setup.exe'
}

else {
$url = 'https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage412095443157247.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_ACD_2025_English_WIN64.exe%22&'
$checksum = 'C475CF6D624F7C25B11FE424D1E9438BBC806AA93E5CBEE0B9FAF282D67F68B0'
$file = Join-Path $downloadsPath 'Autodesk\AutoCAD 2025 - (EN)\Setup.exe'
}

$packageArgsDownload = @{
  packageName    = 'AutoCAD Installation Files'
  fileType       = 'exe'
  url            = $url
  softwareName   = 'AutoCAD Installation Files*'
  checksum       = $checksum
  checksumType   = 'sha256'
  silentArgs     = "-q"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgsDownload

$packageArgs  = @{
  packageName    = 'AutoCAD'
  fileType       = 'exe'
  file           = $file
  softwareName   = 'AutoCAD*'
  silentArgs     = '-q'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgs
