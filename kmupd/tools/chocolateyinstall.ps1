$ErrorActionPreference = 'Stop';

$FAX            = 'https://dl.konicaminolta.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=5d941dae7cb9d54a474cc91c8c4395a2&tx_kmanacondaimport_downloadproxy[documentId]=128824&tx_kmanacondaimport_downloadproxy[system]=KonicaMinolta&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685'
$FAX_checksum   = 'DB75C4511DD2641381D5CCA286CA2B4C7942AEE734B29E36CD7E11907061F71A'
$PCL            = 'https://dl.konicaminolta.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=db69e8d121fea061d1d8558184cc2bc2&tx_kmanacondaimport_downloadproxy[documentId]=128825&tx_kmanacondaimport_downloadproxy[system]=KonicaMinolta&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685'
$PCL_checksum   = '85C5476F7671CC65D3864CB3C6829B0B497D216F2F9AC00B21E18879F2E8B9A9'
$PS             = 'https://dl.konicaminolta.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=5ebe0f108582723d2feba8950d2b5fcc&tx_kmanacondaimport_downloadproxy[documentId]=128826&tx_kmanacondaimport_downloadproxy[system]=KonicaMinolta&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685'
$PS_checksum    = 'C453748DCC581EC85005E7E19163F424BBC358C02C718DF62A6C87260D6918A4'

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
