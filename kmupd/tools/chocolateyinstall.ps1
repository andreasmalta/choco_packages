$ErrorActionPreference = 'Stop';

$PCL            = 'https://dl.konicaminolta.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=fc81b71d454cfae7b9104e06bc05211b&tx_kmanacondaimport_downloadproxy[documentId]=126942&tx_kmanacondaimport_downloadproxy[system]=KonicaMinolta&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685'
$PCL_checksum   = '847731F2FD7C8E6DE98618E3C51F9D0E5E47CBC990B713BA1FB620AC1E09D3C3'
$PCL5           = 'https://dl.konicaminolta.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=d51187f49809251bc17f5a9565ee22d1&tx_kmanacondaimport_downloadproxy[documentId]=126943&tx_kmanacondaimport_downloadproxy[system]=KonicaMinolta&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685'
$PCL5_checksum  = 'FDB643E46768DBA53A065056AE56B03B87218328764E8443EC34AED811F5B25F'
$PS             = 'https://dl.konicaminolta.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=a146b3a16d8f9f5c390f03aec512ddeb&tx_kmanacondaimport_downloadproxy[documentId]=126944&tx_kmanacondaimport_downloadproxy[system]=KonicaMinolta&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685'
$PS_checksum    = 'AA8509845983BF63CA9568977700DEBAFF55D7084867DAE416CEA9D375E78223'

$PCL_extract    = Join-Path $env:TEMP 'extractPCL'
$PCL5_extract   = Join-Path $env:TEMP 'extractPCL5'
$PS_extract     = Join-Path $env:TEMP 'extractPS'

$packageArgsPCL = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $PCL_extract
	url           = $PCL
	checksum      = $PCL_checksum
	checksumType  = 'sha256'
}
$packageArgsPCL5 = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $PCL5_extract
	url           = $PCL5
	checksum      = $PCL5_checksum
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
if ($pp.'PCL' -or $pp.'PCL5' -or $pp.'PS') { 

	if ($pp.'PCL') { 
	Write-Host "INSTALLING PCL DRIVER"
	Install-ChocolateyZipPackage @packageArgsPCL
	Get-ChildItem $PCL_extract -Recurse -Filter "*.inf" | 
	ForEach-Object { PNPUtil.exe /add-driver $_.FullName /install }
	Add-PrinterDriver -Name "KONICA MINOLTA Universal PCL"
	}

	if ($pp.'PCL5') { 
	Write-Host "INSTALLING PCL5 DRIVER"
	Install-ChocolateyZipPackage @packageArgsPCL5
	Get-ChildItem $PCL5_extract -Recurse -Filter "*.inf" | 
	ForEach-Object { PNPUtil.exe /add-driver $_.FullName /install }
	Add-PrinterDriver -Name "KONICA MINOLTA Universal PCL5"
	}

	if ($pp.'PS') { 
	Write-Host "INSTALLING PS DRIVER"
	Install-ChocolateyZipPackage @packageArgsPS
	Get-ChildItem $PS_extract -Recurse -Filter "*.inf" | 
	ForEach-Object { PNPUtil.exe /add-driver $_.FullName /install }
	Add-PrinterDriver -Name "KONICA MINOLTA Universal PS"
	}

} else {
	Write-Host "INSTALLING PCL/PCL5/PS DRIVERS"
	Install-ChocolateyZipPackage @packageArgsPCL
	Get-ChildItem $PCL_extract -Recurse -Filter "*.inf" | 
	ForEach-Object { PNPUtil.exe /add-driver $_.FullName /install }
	Add-PrinterDriver -Name "KONICA MINOLTA Universal PCL"

	Install-ChocolateyZipPackage @packageArgsPCL5
	Get-ChildItem $PCL5_extract -Recurse -Filter "*.inf" | 
	ForEach-Object { PNPUtil.exe /add-driver $_.FullName /install }
	Add-PrinterDriver -Name "KONICA MINOLTA Universal PCL5"

	Install-ChocolateyZipPackage @packageArgsPS
	Get-ChildItem $PS_extract -Recurse -Filter "*.inf" | 
	ForEach-Object { PNPUtil.exe /add-driver $_.FullName /install }
	Add-PrinterDriver -Name "KONICA MINOLTA Universal PS"
}
