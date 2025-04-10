$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#1 DOWNLOAD
$url1 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2026/RVTLT/1C329069-94F8-36BA-B5C2-8328925E9347/SFX/RVTLT_2026_NA_win_db_001_002.exe'
$checksum1 = '0AA8BD846F63144648591D5799FC999CA5872284059F4E44AFDD322727AB3FD7'
$file = $env:TEMP + '\RVTLT_2026_NA_win_db_001_002.exe'
$url2 = 'https://efulfillment.autodesk.com/NetSWDLD/ODIS/prd/2026/RVTLT/1C329069-94F8-36BA-B5C2-8328925E9347/SFX/RVTLT_2026_NA_win_db_002_002.7z'
$checksum2 = 'CB8D1C28F5AA836F471483C2FEA54A814D7D83B39089228831956B40229D7043'
$zip = $env:TEMP + '\RVTLT_2026_NA_win_db_002_002.7z'
Get-ChocolateyWebFile -PackageName 'EXE package' -FileFullPath $file -Url $url1 -Checksum $checksum1 -ChecksumType 'sha256'
Get-ChocolateyWebFile -PackageName 'ZIP package' -FileFullPath $zip -Url $url2 -Checksum $checksum2 -ChecksumType 'sha256'

#2 UNINSTALL OLD
. $toolsDir\helpers.ps1
Invoke-UninstallOLD

#3 INSTALL
$packageArgs  = @{
  packageName    = 'Revit LT'
  fileType       = 'exe'
  file           = $file
  softwareName   = 'Revit LT*'
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
