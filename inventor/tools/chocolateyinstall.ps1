$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$downloadsPath = (New-Object -ComObject Shell.Application).Namespace('shell:Downloads').Self.Path

#1 LANGUAGE SELECTION
$pp = Get-PackageParameters

if ($pp.'ChineseSimp') {
$url = 'https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage385696437542230.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_INVPROSA_2025_Simplified_Chinese_WIN64.exe%22&'
$checksum = '0CDF93B094E7B36E49982C67B60A7A5A4B4262236A931069D33E10DD347E6D63'
$file = Join-Path $downloadsPath 'Autodesk\Inventor Professional 2025 - (ZH)\Setup.exe'
}

elseif ($pp.'ChineseTrad') {
$url = 'https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage385579577463003.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_INVPROSA_2025_Traditional_Chinese_WIN64.exe%22&'
$checksum = '2A2867E1DFBEF1589878B80E829BAF05F8F0ACE2EC6DE40257F8EDB60FEED6CE'
$file = Join-Path $downloadsPath 'Autodesk\Inventor Professional 2025 - (ZH)\Setup.exe'
}

elseif ($pp.'Czech') {
$url = 'https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage385221052944295.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_INVPROSA_2025_Czech_WIN64.exe%22&'
$checksum = '4B5D8EE885DFFFA6E58E6F67AA7799E4DB678E5190A06C90DFE5E0FA3C7C608C'
$file = Join-Path $downloadsPath 'Autodesk\Inventor Professional 2025 - (CS)\Setup.exe'
}

elseif ($pp.'French') {
$url = 'https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage385412582400660.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_INVPROSA_2025_French_WIN64.exe%22&'
$checksum = '6CFF7507E6A4EA6AEBA0D669B785DA304C9B8B6291FFF1BB5824DEE747E12B55'
$file = Join-Path $downloadsPath 'Autodesk\Inventor Professional 2025 - (FR)\Setup.exe'
}

elseif ($pp.'German') {
$url = 'https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage385410714722930.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_INVPROSA_2025_German_WIN64.exe%22&'
$checksum = '4D6448E0AE72FDC1016BBAE85551D37959E3754C67D2DDB5C0369F858FF0D28E'
$file = Join-Path $downloadsPath 'Autodesk\Inventor Professional 2025 - (DE)\Setup.exe'
}

elseif ($pp.'Italian') {
$url = 'https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage385611031214626.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_INVPROSA_2025_Italian_WIN64.exe%22&'
$checksum = 'C3A6FBDEA23320B672EBC8640E046794EDCB5133BF6B6F8E353937B2177FCDF8'
$file = Join-Path $downloadsPath 'Autodesk\Inventor Professional 2025 - (IT)\Setup.exe'
}

elseif ($pp.'Japanese') {
$url = 'https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage385423275029503.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_INVPROSA_2025_Japanese_WIN64.exe%22&'
$checksum = '2D5A0D80430496287DE0F3CF1E1CDC8ACD2B079DAFD8E96E977CD22F1F047BBB'
$file = Join-Path $downloadsPath 'Autodesk\Inventor Professional 2025 - (JA)\Setup.exe'
}

elseif ($pp.'Korean') {
$url = 'https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage385447193465575.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_INVPROSA_2025_Korean_WIN64.exe%22&'
$checksum = 'A2DA42DA38FB4366DBBA0BBBF13CB6488F39DAF6328BA0C641006B7A2BA3FBDD'
$file = Join-Path $downloadsPath 'Autodesk\Inventor Professional 2025 - (KO)\Setup.exe'
}

elseif ($pp.'Polish') {
$url = 'https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage385447150630255.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_INVPROSA_2025_Polish_WIN64.exe%22&'
$checksum = '6E14129D61622EA9A0B28D6477D080DE8BA89909811FCF08765C8D50C9B7C12D'
$file = Join-Path $downloadsPath 'Autodesk\Inventor Professional 2025 - (PL)\Setup.exe'
}

elseif ($pp.'Portuguese') {
$url = 'https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage385501169826183.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_INVPROSA_2025_Portuguese_WIN64.exe%22&'
$checksum = '6970F1541A2C8EEA874CCBC2D3BD9E98997ECC4F07841F00575C62AD79CC4900'
$file = Join-Path $downloadsPath 'Autodesk\Inventor Professional 2025 - (PT)\Setup.exe'
}

elseif ($pp.'Russian') {
$url = 'https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage385496953211724.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_INVPROSA_2025_Russian_WIN64.exe%22&'
$checksum = 'CD8B3281A40D9610F64661FEAB301C96BB931D177DD1149A2469A1CB59F89FE2'
$file = Join-Path $downloadsPath 'Autodesk\Inventor Professional 2025 - (RU)\Setup.exe'
}

elseif ($pp.'Spanish') {
$url = 'https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage385524285822504.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_INVPROSA_2025_Spanish_WIN64.exe%22&'
$checksum = '50CABCBFCEC7538ACE182E46ADECABBF6FA3CA9D347D4B279C30824EB20ECD78'
$file = Join-Path $downloadsPath 'Autodesk\Inventor Professional 2025 - (ES)\Setup.exe'
}

else {
$url = 'https://upload1.delivery.autodesk.com/PORTAL_DownloadPackage385384228834525.exe?response-content-disposition=attachment%3B%20filename%20%3D%22Create_Installer_INVPROSA_2025_English_WIN64.exe%22&'
$checksum = 'FC3DEBCD476D84F3BB796B6265E9C2DC756C54DDA1B19B8A2D8DCE51BDE5F5B1'
$file = Join-Path $downloadsPath 'Autodesk\Inventor Professional 2025 - (EN)\Setup.exe'
}

#2 DOWNLOAD
$packageArgsDownload = @{
  packageName    = 'Inventor Installation Files'
  fileType       = 'exe'
  url            = $url
  softwareName   = 'Inventor Installation Files*'
  checksum       = $checksum
  checksumType   = 'sha256'
  silentArgs     = "-q"
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgsDownload

#3 UNINSTALL OLD
. $toolsDir\helpers.ps1
Invoke-UninstallInventor

#4 INSTALL
$packageArgs  = @{
  packageName    = 'Inventor'
  fileType       = 'exe'
  file           = $file
  softwareName   = 'Inventor*'
  silentArgs     = '-q'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgs
