$ErrorActionPreference = 'Stop';

$FAX = 'https://dl.develop.eu/en/?tx_kmdownloadcentersite_downloadproxy[fileId]=d3b0752a8cef634cae07374fd07e611b&tx_kmdownloadcentersite_downloadproxy[documentId]=138076&tx_kmdownloadcentersite_downloadproxy[system]=Develop&tx_kmdownloadcentersite_downloadproxy[language]=EN&type=1558521685'
$FAX_checksum = '582EA833424335E416B8590934143A5211B2ADDDCDC301AA0D00B1CFA2518A3E'
$PCL = 'https://dl.develop.eu/en/?tx_kmdownloadcentersite_downloadproxy[fileId]=27864185c731a2343a77337917555614&tx_kmdownloadcentersite_downloadproxy[documentId]=138074&tx_kmdownloadcentersite_downloadproxy[system]=Develop&tx_kmdownloadcentersite_downloadproxy[language]=EN&type=1558521685'
$PCL_checksum = '4C563106ADA24765C0E5853800E7F5D5E61AE3711D9416246AA1E3A69456E9F1'
$PS = 'https://dl.develop.eu/en/?tx_kmdownloadcentersite_downloadproxy[fileId]=b72bf61ca3c363d471c66a8a6c8fe99f&tx_kmdownloadcentersite_downloadproxy[documentId]=138075&tx_kmdownloadcentersite_downloadproxy[system]=Develop&tx_kmdownloadcentersite_downloadproxy[language]=EN&type=1558521685'
$PS_checksum = 'BB8C79EAA57A1427D1EEF600FED7B037634440502C13CC3E758E997C4E5AE4F2'

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
