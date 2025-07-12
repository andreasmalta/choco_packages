$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#1 DOWNLOAD
$url = 'https://dds.autodesk.com/NetSWDLD/ODIS/prd/2026/NAVFREE/BE06C262-73A9-3C2F-8982-C105E1EE9A34/SFX/Autodesk_Navisworks_Freedom_2026_Win_64bit_db.sfx.exe'
$checksum = '64E6987FB20244AC945378092075363E67FB7684161FFE1D20ED9E4420657A47'
$file = $env:TEMP + '\Autodesk_Navisworks_Freedom_2026_Win_64bit_db.sfx.exe'
Get-ChocolateyWebFile -PackageName 'EXE package' -FileFullPath $file -Url $url -Checksum $checksum -ChecksumType 'sha256'

#2 UNINSTALL OLD VERSIONS
. $toolsDir\helpers.ps1
Invoke-UninstallOld

#3 INSTALL
$packageArgs  = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  file           = $file
  softwareName   = 'Navisworks Freedom*'
  silentArgs     = '-q'
  validExitCodes = @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgs

#4 WAIT UNTIL INSTALLED
Write-Host "Waiting for Autodesk Installer to finish..."
Start-Sleep 120
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
