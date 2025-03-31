$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#1 LANGUAGE SELECTION
$pp = Get-PackageParameters
if ($pp.'French') {
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2026/PLC0000037/F0A4D097-C6CF-3865-A8AA-8B0C4434EF86/SFX/DWGTrueView_2026_French_64bit_db_001_002.exe'
$checksum1 = 'EC5D57E4400B2CC3988BACED06BDE9A7DE44F601EFD4C59CC268EB28EC32FF6C'
$file = $env:TEMP + '\DWGTrueView_2026_French_64bit_db_001_002.exe'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2026/PLC0000037/F0A4D097-C6CF-3865-A8AA-8B0C4434EF86/SFX/DWGTrueView_2026_French_64bit_db_002_002.7z'
$checksum2 = 'A2DD8093E985B535ECC6E2BD83D68BB9DC5335713BC8CC71B006153DB003CC0C'
$zip = $env:TEMP + '\DWGTrueView_2026_French_64bit_db_002_002.7z'
}

elseif ($pp.'Japanese') {
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2026/PLC0000037/43214E3A-22E1-36F4-81A4-456CE5E0FC4F/SFX/DWGTrueView_2026_Japanese_64bit_db_001_002.exe'
$checksum1 = '207D584B01C6E25D5FCC1B1842BB433D824A1F09F06FB13934B51C2473790449'
$file = $env:TEMP + '\DWGTrueView_2026_Japanese_64bit_db_001_002.exe'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2026/PLC0000037/43214E3A-22E1-36F4-81A4-456CE5E0FC4F/SFX/DWGTrueView_2026_Japanese_64bit_db_002_002.7z'
$checksum2 = '243B33AEE77FE36324439737EFBDEB0D6CBCA01250DACD03F58180927638B88E'
$zip = $env:TEMP + '\DWGTrueView_2026_Japanese_64bit_db_002_002.7z'
}

else {
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2026/PLC0000037/9506362F-6781-39A3-B671-2BDAF86819F8/SFX/DWGTrueView_2026_English_64bit_db_001_002.exe'
$checksum1 = 'CC1EAB29E3639E452823512458C1685047E057004C073E33399148527A8E3DD7'
$file = $env:TEMP + '\DWGTrueView_2026_English_64bit_db_001_002.exe'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2026/PLC0000037/9506362F-6781-39A3-B671-2BDAF86819F8/SFX/DWGTrueView_2026_English_64bit_db_002_002.7z'
$checksum2 = 'C692818F8338FEA594BD1C2747762319B471B9126119A706304590E8C0918787'
$zip = $env:TEMP + '\DWGTrueView_2026_English_64bit_db_002_002.7z'
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

#5 WAIT UNTIL INSTALLED
Write-Host "Waiting for Autodesk Installer to finish, trying again in 30 seconds..."
Start-Sleep 30
while ($true) {
    # (re)try
    $processCHK = Get-Process | Where {$_.ProcessName -Like 'Installer'}
    if ($processCHK -eq $null)
    {
        Write-Host "Autodesk Installer ready!"
		# exit the loop
        break;
    }
    # wait
    Write-Host "Waiting for Autodesk Installer to finish, trying again in 30 seconds..."
    Start-Sleep 30
}
