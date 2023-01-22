$ErrorActionPreference = 'Stop';

$FAX = 'https://dl.develop.eu/en/?tx_kmdownloadcentersite_downloadproxy[fileId]=c0475df13b6c61eb24f0697cd477adf0&tx_kmdownloadcentersite_downloadproxy[documentId]=135984&tx_kmdownloadcentersite_downloadproxy[system]=Develop&tx_kmdownloadcentersite_downloadproxy[language]=EN&type=1558521685'
$FAX_checksum = '0E87B3D1F0690C3515E6B7EB30E77B52A86F389B8FC40E7DC7621BFAAFE4E444'
$PCL = 'https://dl.develop.eu/en/?tx_kmdownloadcentersite_downloadproxy[fileId]=f701491af277bd93fefb3a70015a579b&tx_kmdownloadcentersite_downloadproxy[documentId]=135982&tx_kmdownloadcentersite_downloadproxy[system]=Develop&tx_kmdownloadcentersite_downloadproxy[language]=EN&type=1558521685'
$PCL_checksum = '593D6416913314FF9AD217D8FFE67F2A54E635AAC7D3264DC9D5C16CFB2D8B2F'
$PS = 'https://dl.develop.eu/en/?tx_kmdownloadcentersite_downloadproxy[fileId]=dae935107c6515c6999262b2e5681d59&tx_kmdownloadcentersite_downloadproxy[documentId]=135983&tx_kmdownloadcentersite_downloadproxy[system]=Develop&tx_kmdownloadcentersite_downloadproxy[language]=EN&type=1558521685'
$PS_checksum = '78D6166EE5838B1380503C8342AABCB2063B8DEB4EC87C66E9A01244FD87A6E2'

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
