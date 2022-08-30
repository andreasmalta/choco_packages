$ErrorActionPreference = 'Stop';
$url = 'https://ftp.ext.hp.com/pub/softpaq/sp141501-142000/sp141746.exe'
$checksum = '55EDA4479FEEED98EBCC77700289C7F90AEB2FD8F6BE9C6D8F50A7C05C422C5E'

#Uninstall old version before upgrade
$DisplayName = 'HP PC Hardware Diagnostics Windows'
$ExitCodes = @(0, 3010, 1605, 1614, 1641)
Get-ItemProperty -Path @('HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
                         'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*') `
                 -ErrorAction:SilentlyContinue `
| Where-Object   {$_.DisplayName -like $DisplayName} `
| ForEach-Object {
	$silentArgs = '/qn /norestart'
	$file = "$($_.UninstallString)"
	$silentArgs = "$($_.PSChildName) $silentArgs"
	$file = ''
	Uninstall-ChocolateyPackage -PackageName "$DisplayName" -FileType "msi" -SilentArgs "$($silentArgs)" -File "$file" -ValidExitCodes $ExitCodes
	}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  file          = $url
  softwareName  = 'hp pc hardware diagnostics*'
  checksum      = $checksum
  checksumType  = 'sha256'
  silentArgs    = "/S"
  validExitCodes= @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgs
