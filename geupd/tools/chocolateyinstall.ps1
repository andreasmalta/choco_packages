$ErrorActionPreference = 'Stop';
$FAX = 'https://dl.develop.eu/en/?tx_kmdownloadproxy_downloadproxy[fileId]=7bfb3e70b8ba012282da641efa886ca0&tx_kmdownloadproxy_downloadproxy[documentId]=144735&tx_kmdownloadproxy_downloadproxy[system]=Develop&tx_kmdownloadproxy_downloadproxy[language]=EN&type=1558521685'
$FAX_checksum = '4384E297E2F3FAA64426FB89BB2D7DA23055584074B4A1537D89231074536009'
$PCL = 'https://dl.develop.eu/en/?tx_kmdownloadproxy_downloadproxy[fileId]=878a4c3ab658c8321c2c68087d8c92c5&tx_kmdownloadproxy_downloadproxy[documentId]=144734&tx_kmdownloadproxy_downloadproxy[system]=Develop&tx_kmdownloadproxy_downloadproxy[language]=EN&type=1558521685'
$PCL_checksum = '0C29087C7D010F66B9A664626DF2D2BB110EB1BF6E66EC6AEE5C38A482B66CBB'
$PS = 'https://dl.develop.eu/en/?tx_kmdownloadproxy_downloadproxy[fileId]=5807a49067243cc913488f1c0a0b6adb&tx_kmdownloadproxy_downloadproxy[documentId]=144733&tx_kmdownloadproxy_downloadproxy[system]=Develop&tx_kmdownloadproxy_downloadproxy[language]=EN&type=1558521685'
$PS_checksum = '01864FBF319E420F154EB4E6A50C6B5FAE463C66462F49230E17F1DFE0A07DB3'

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
