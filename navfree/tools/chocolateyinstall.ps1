$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#1 DOWNLOAD
$url = 'https://dds.autodesk.com/NetSWDLD/ODIS/prd/2027/NAVFREE/52AC45A2-3099-370C-8394-8B347967768B/SFX/Autodesk_Navisworks_Freedom_2027_Win_64bit_db.sfx.exe'
$checksum = '76BAFE8532E888ABE2DB69BA1C1A9DC2C2EAD9265767AD8425546E33568A7E22'
$file = $env:TEMP + '\Autodesk_Navisworks_Freedom_2027_Win_64bit_db.sfx.exe'
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
