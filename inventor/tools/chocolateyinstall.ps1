$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#1 DOWNLOAD
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2026/INVPROSA/4262E5C6-0D93-3251-AD48-1E947463A640/SFX/Inventor_Professional_2026_English_Win_64bit_db_001_002.exe'
$checksum1 = '980C4D9E3F02E054DA197B7B51B5AA433A7963A637DBBB6196364C9D88B0BD72'
$file = $env:TEMP + '\Inventor_Professional_2026_English_Win_64bit_db_001_002.exe'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2026/INVPROSA/4262E5C6-0D93-3251-AD48-1E947463A640/SFX/Inventor_Professional_2026_English_Win_64bit_db_002_002.7z'
$checksum2 = '32B98C8787134745848CBB167A6ADF4F986C7B44E0C9576ADDC155F8786AED27'
$zip = $env:TEMP + '\Inventor_Professional_2026_English_Win_64bit_db_002_002.7z'
Get-ChocolateyWebFile -PackageName 'EXE package' -FileFullPath $file -Url $url1 -Checksum $checksum1 -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'ZIP package' -FileFullPath $zip -Url $url2 -Checksum $checksum2 -ChecksumType 'sha256'

#2 UNINSTALL OLD
. $toolsDir\helpers.ps1
Invoke-UninstallInventor

#3 INSTALL
$packageArgs  = @{
  packageName    = 'Inventor'
  fileType       = 'exe'
  file           = $file
  softwareName   = 'Inventor*'
  silentArgs     = '-q'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgs

#4 WAIT UNTIL INSTALLED
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
