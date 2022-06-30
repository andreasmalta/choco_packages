$ErrorActionPreference = 'Stop';

$FAX = 'https://dl.develop.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=094d234fb06d858e5e587e342b3b4ff3&tx_kmanacondaimport_downloadproxy[documentId]=133842&tx_kmanacondaimport_downloadproxy[system]=Develop&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685'
$FAX_checksum = 'A6A519FA4A122E7C81F2F9AF9CF80EBE436125F8F1AA722A28AD672DF50DE110'
$PCL = 'https://dl.develop.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=c4c337b77a455447c6fc58cb9c1abed6&tx_kmanacondaimport_downloadproxy[documentId]=133840&tx_kmanacondaimport_downloadproxy[system]=Develop&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685'
$PCL_checksum = 'B6F7F655F2B68F30A093965E53A0B982E66F088E4105078E8BFF7A4661CABB42'
$PS = 'https://dl.develop.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=9cbb50bff3ce0cf9d0df5d44abd79233&tx_kmanacondaimport_downloadproxy[documentId]=133841&tx_kmanacondaimport_downloadproxy[system]=Develop&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685'
$PS_checksum = 'C04C4B899C07C9F0E6C1781F2FAC5A6AFFBB6046D4E602818F27F603F70CB95D'

function Invoke-packageArgsFAX {
	$FAX_extract = Join-Path $env:TEMP 'extractFAX'
	$packageArgsFAX = @{
		packageName   = $env:ChocolateyPackageName
		unzipLocation = $FAX_extract
		url           = $FAX
		checksum      = $FAX_checksum
		checksumType  = 'sha256'
	}
	Write-Host "INSTALLING FAX DRIVER"
	Install-ChocolateyZipPackage @packageArgsFAX
	Get-ChildItem $FAX_extract -Recurse -Filter "*.inf" | 
	ForEach-Object { PNPUtil.exe /add-driver $_.FullName /install }
	Add-PrinterDriver -Name "Generic Universal FAX"
}

function Invoke-packageArgsPCL {
	$PCL_extract = Join-Path $env:TEMP 'extractPCL'
	$packageArgsPCL = @{
		packageName   = $env:ChocolateyPackageName
		unzipLocation = $PCL_extract
		url           = $PCL
		checksum      = $PCL_checksum
		checksumType  = 'sha256'
	}
	Write-Host "INSTALLING PCL DRIVER"
	Install-ChocolateyZipPackage @packageArgsPCL
	Get-ChildItem $PCL_extract -Recurse -Filter "*.inf" | 
	ForEach-Object { PNPUtil.exe /add-driver $_.FullName /install }
	Add-PrinterDriver -Name "Generic Universal PCL"
}

function Invoke-packageArgsPS {
	$PS_extract = Join-Path $env:TEMP 'extractPS'
	$packageArgsPS = @{
		packageName   = $env:ChocolateyPackageName
		unzipLocation = $PS_extract
		url           = $PS
		checksum      = $PS_checksum
		checksumType  = 'sha256'
	}
	Write-Host "INSTALLING PS DRIVER"
	Install-ChocolateyZipPackage @packageArgsPS
	Get-ChildItem $PS_extract -Recurse -Filter "*.inf" | 
	ForEach-Object { PNPUtil.exe /add-driver $_.FullName /install }
	Add-PrinterDriver -Name "Generic Universal PS"
}

$pp = Get-PackageParameters
if ($pp.'FAX' -or $pp.'PCL' -or $pp.'PS') { 

	if ($pp.'FAX') { 
	Invoke-packageArgsFAX
	}

	if ($pp.'PCL') { 
	Invoke-packageArgsPCL
	}

	if ($pp.'PS') { 
	Invoke-packageArgsPS
	}

} else {
	Write-Host "INSTALLING FAX/PCL/PS DRIVERS"
	Invoke-packageArgsFAX
	Invoke-packageArgsPCL
	Invoke-packageArgsPS
}
