$ErrorActionPreference = 'Stop';
$FAX = 'https://dl.develop.eu/en/?tx_kmdownloadproxy_downloadproxy[fileId]=c05fcad9b8991327f1dda6c7f4349193&tx_kmdownloadproxy_downloadproxy[documentId]=145287&tx_kmdownloadproxy_downloadproxy[system]=Develop&tx_kmdownloadproxy_downloadproxy[language]=EN&type=1558521685'
$FAX_checksum = '5B115A29223CB835928C7F34E37B2BB24829FDE580342F9FEDC92AA855785918'
$PCL = 'https://dl.develop.eu/en/?tx_kmdownloadproxy_downloadproxy[fileId]=4b89c96e59cb21a385ca0fcf3ab07d60&tx_kmdownloadproxy_downloadproxy[documentId]=145285&tx_kmdownloadproxy_downloadproxy[system]=Develop&tx_kmdownloadproxy_downloadproxy[language]=EN&type=1558521685'
$PCL_checksum = '8C62E2D5672F9383BEE7A7CD6C501CE14A8639277871B01EBB987BBE9FFD93AF'
$PS = 'https://dl.develop.eu/en/?tx_kmdownloadproxy_downloadproxy[fileId]=00090b7d9cb495d061e4bf29808d2781&tx_kmdownloadproxy_downloadproxy[documentId]=145286&tx_kmdownloadproxy_downloadproxy[system]=Develop&tx_kmdownloadproxy_downloadproxy[language]=EN&type=1558521685'
$PS_checksum = '515C2B9CF8D353E8EF2DF9231D04685DA228536C5D43E4AE5728D009D351EBB0'

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
