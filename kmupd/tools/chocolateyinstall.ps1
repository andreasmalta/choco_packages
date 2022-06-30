$ErrorActionPreference = 'Stop';

$FAX = 'https://dl.konicaminolta.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=8bdab7aa6c67fc47fa0f003f6138f84a&tx_kmanacondaimport_downloadproxy[documentId]=133839&tx_kmanacondaimport_downloadproxy[system]=KonicaMinolta&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685'
$FAX_checksum = '0CD7DDED665C4583EA04EE75AA81B781D27621A1FEE3F1FD220FD188232B891B'
$PCL = 'https://dl.konicaminolta.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=40d4efc46c2898c10808a222e2472ac1&tx_kmanacondaimport_downloadproxy[documentId]=133837&tx_kmanacondaimport_downloadproxy[system]=KonicaMinolta&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685'
$PCL_checksum = '810970D80987CB1668D81747D41E2D27C39653710856E82F1C950C3F4AABE3CB'
$PS = 'https://dl.konicaminolta.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=cfa7ad9b42789594d214dd5d2661e2d9&tx_kmanacondaimport_downloadproxy[documentId]=133838&tx_kmanacondaimport_downloadproxy[system]=KonicaMinolta&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685'
$PS_checksum = '344CF3CDAD9C9189285B2C0DEC5B148E3E7534FBF4358F18B1B8D3B8FD35D966'

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
	Add-PrinterDriver -Name "KONICA MINOLTA Universal FAX"
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
	Add-PrinterDriver -Name "KONICA MINOLTA Universal PCL"
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
	Add-PrinterDriver -Name "KONICA MINOLTA Universal PS"
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
