$ErrorActionPreference = 'Stop';
$FAX = 'https://dl.konicaminolta.eu/en/?tx_kmdownloadproxy_downloadproxy[fileId]=c71c7f13dd8fd9a6278186e8cd1b449d&tx_kmdownloadproxy_downloadproxy[documentId]=144420&tx_kmdownloadproxy_downloadproxy[system]=KonicaMinolta&tx_kmdownloadproxy_downloadproxy[language]=EN&type=1558521685'
$FAX_checksum = '9A37A04B54C2FD263192E15DF10031B7B5549AA6AE53C5A79873F83579FB1FDC'
$PCL = 'https://dl.konicaminolta.eu/en/?tx_kmdownloadproxy_downloadproxy[fileId]=1378842ff55e4a44ed8520d46cb64657&tx_kmdownloadproxy_downloadproxy[documentId]=144418&tx_kmdownloadproxy_downloadproxy[system]=KonicaMinolta&tx_kmdownloadproxy_downloadproxy[language]=EN&type=1558521685'
$PCL_checksum = '4EAA772EBBFF9CF5C3DF9C944275879E21C44264C0B45518D13F61361930C4B2'
$PS = 'https://dl.konicaminolta.eu/en/?tx_kmdownloadproxy_downloadproxy[fileId]=3c9fe2e4fdfe6de5be1285a15c345a06&tx_kmdownloadproxy_downloadproxy[documentId]=144419&tx_kmdownloadproxy_downloadproxy[system]=KonicaMinolta&tx_kmdownloadproxy_downloadproxy[language]=EN&type=1558521685'
$PS_checksum = '8E82B8C7E7C3A35B08B1E47CA242DCB19396D65AFC2417AB475BB806EFE9F541'

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
