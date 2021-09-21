$ErrorActionPreference = 'Stop';

$PCL            = 'https://dl.konicaminolta.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=db69e8d121fea061d1d8558184cc2bc2&tx_kmanacondaimport_downloadproxy[documentId]=128825&tx_kmanacondaimport_downloadproxy[system]=KonicaMinolta&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685'
$PCL_checksum   = '85C5476F7671CC65D3864CB3C6829B0B497D216F2F9AC00B21E18879F2E8B9A9'
$PS             = 'https://dl.konicaminolta.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=5ebe0f108582723d2feba8950d2b5fcc&tx_kmanacondaimport_downloadproxy[documentId]=128826&tx_kmanacondaimport_downloadproxy[system]=KonicaMinolta&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685'
$PS_checksum    = 'C453748DCC581EC85005E7E19163F424BBC358C02C718DF62A6C87260D6918A4'

$PCL_extract    = Join-Path $env:TEMP 'extractPCL'
$PS_extract     = Join-Path $env:TEMP 'extractPS'

$validExitCodes = @(0, 3010, 1605, 1614, 1641)
Uninstall-ChocolateyPackage -PackageName "Universal PCL6 x64 Multi-Lingual driver" -FileType "msi" -SilentArgs "{710D3701-E7E6-4958-A75B-60663234694D} /qn /norestart" -ValidExitCodes $validExitCodes
Uninstall-ChocolateyPackage -PackageName "Universal PS x64 Multi-Lingual driver" -FileType "msi" -SilentArgs "{8F32D344-DE7B-4D48-ADD0-1811AE858FFE} /qn /norestart" -ValidExitCodes $validExitCodes
Uninstall-ChocolateyPackage -PackageName "Universal PCL5 x64 Multi-Lingual driver" -FileType "msi" -SilentArgs "{A8C9B8BA-88CA-4322-B686-9AD7330BCF06} /qn /norestart" -ValidExitCodes $validExitCodes

$packageArgsPCL = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $PCL_extract
	url           = $PCL
	checksum      = $PCL_checksum
	checksumType  = 'sha256'
}
$packageArgsPS = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $PS_extract
	url           = $PS
	checksum      = $PS_checksum
	checksumType  = 'sha256'
}

$pp = Get-PackageParameters
if ($pp.'PCL' -or $pp.'PS') { 

	if ($pp.'PCL') { 
	Write-Host "INSTALLING PCL DRIVER"
	Install-ChocolateyZipPackage @packageArgsPCL
	Get-ChildItem $PCL_extract -Recurse -Filter "*.inf" | 
	ForEach-Object { PNPUtil.exe /add-driver $_.FullName /install }
	Add-PrinterDriver -Name "KONICA MINOLTA Universal PCL"
	}

	if ($pp.'PS') { 
	Write-Host "INSTALLING PS DRIVER"
	Install-ChocolateyZipPackage @packageArgsPS
	Get-ChildItem $PS_extract -Recurse -Filter "*.inf" | 
	ForEach-Object { PNPUtil.exe /add-driver $_.FullName /install }
	Add-PrinterDriver -Name "KONICA MINOLTA Universal PS"
	}

} else {
	Write-Host "INSTALLING PCL/PS DRIVERS"
	Install-ChocolateyZipPackage @packageArgsPCL
	Get-ChildItem $PCL_extract -Recurse -Filter "*.inf" | 
	ForEach-Object { PNPUtil.exe /add-driver $_.FullName /install }
	Add-PrinterDriver -Name "KONICA MINOLTA Universal PCL"

	Install-ChocolateyZipPackage @packageArgsPS
	Get-ChildItem $PS_extract -Recurse -Filter "*.inf" | 
	ForEach-Object { PNPUtil.exe /add-driver $_.FullName /install }
	Add-PrinterDriver -Name "KONICA MINOLTA Universal PS"
}
