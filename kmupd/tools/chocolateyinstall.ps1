$ErrorActionPreference = 'Stop';

$FAX            = 'https://dl.konicaminolta.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=72e3d35146daf16029a74882ce64d981&tx_kmanacondaimport_downloadproxy[documentId]=129834&tx_kmanacondaimport_downloadproxy[system]=KonicaMinolta&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685'
$FAX_checksum   = '45D92412E920F898D7F77F45A33DF2E6C957E45689EEAEA012EFA53C553EBECF'
$PCL            = 'https://dl.konicaminolta.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=6445b83e71773b350e6e8f5af0b97bd1&tx_kmanacondaimport_downloadproxy[documentId]=129832&tx_kmanacondaimport_downloadproxy[system]=KonicaMinolta&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685'
$PCL_checksum   = 'C5BF9D1A9AD90CFDBE774D109C076A59E2895041613D360CDEB5796516121582'
$PS             = 'https://dl.konicaminolta.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=60e52c5052b4f023a051e49606abce7c&tx_kmanacondaimport_downloadproxy[documentId]=129833&tx_kmanacondaimport_downloadproxy[system]=KonicaMinolta&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685'
$PS_checksum    = '9286C3CA2B42620544B15A1E2EBE634988C747C90DE6D81DC17A5BEE0792A818'

$FAX_extract    = Join-Path $env:TEMP 'extractFAX'
$PCL_extract    = Join-Path $env:TEMP 'extractPCL'
$PS_extract     = Join-Path $env:TEMP 'extractPS'

$packageArgsFAX = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $FAX_extract
	url           = $FAX
	checksum      = $FAX_checksum
	checksumType  = 'sha256'
}
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
if ($pp.'FAX' -or $pp.'PCL' -or $pp.'PS') { 

	if ($pp.'FAX') { 
	Write-Host "INSTALLING FAX DRIVER"
	Install-ChocolateyZipPackage @packageArgsFAX
	Get-ChildItem $FAX_extract -Recurse -Filter "*.inf" | 
	ForEach-Object { PNPUtil.exe /add-driver $_.FullName /install }
	Add-PrinterDriver -Name "KONICA MINOLTA Universal FAX"
	}

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
	Write-Host "INSTALLING FAX/PCL/PS DRIVERS"

	Install-ChocolateyZipPackage @packageArgsFAX
	Get-ChildItem $FAX_extract -Recurse -Filter "*.inf" | 
	ForEach-Object { PNPUtil.exe /add-driver $_.FullName /install }
	Add-PrinterDriver -Name "KONICA MINOLTA Universal FAX"

	Install-ChocolateyZipPackage @packageArgsPCL
	Get-ChildItem $PCL_extract -Recurse -Filter "*.inf" | 
	ForEach-Object { PNPUtil.exe /add-driver $_.FullName /install }
	Add-PrinterDriver -Name "KONICA MINOLTA Universal PCL"

	Install-ChocolateyZipPackage @packageArgsPS
	Get-ChildItem $PS_extract -Recurse -Filter "*.inf" | 
	ForEach-Object { PNPUtil.exe /add-driver $_.FullName /install }
	Add-PrinterDriver -Name "KONICA MINOLTA Universal PS"
}
