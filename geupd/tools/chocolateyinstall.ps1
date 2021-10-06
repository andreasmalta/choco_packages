$ErrorActionPreference = 'Stop';
$urlPCL     = 'https://dl.develop.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=3781038422c14d7b0b65bb678a983de8&tx_kmanacondaimport_downloadproxy[documentId]=129423&tx_kmanacondaimport_downloadproxy[system]=Develop&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685'
$urlPCL_checksum = '4330DB1F2BF3313E8DD88729EB0D0E49AAEAB80B598A0C53015F89B5BD56016E'
$urlFAX    = 'https://dl.develop.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=c0365c7739dd5be9d95af1b233a09293&tx_kmanacondaimport_downloadproxy[documentId]=129422&tx_kmanacondaimport_downloadproxy[system]=Develop&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685'
$urlFAX_checksum = '2F028CDC756E9F98892CB9CE78118496563257D27053303830F04B0050B1C7C1'
$urlPS      = 'https://dl.develop.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=4af03c9451268c8908628972511516f8&tx_kmanacondaimport_downloadproxy[documentId]=129424&tx_kmanacondaimport_downloadproxy[system]=Develop&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685'
$urlPS_checksum = 'E1B86648C27909D773B136450A5B535BA86A834AA2954D8B2161AFBB9491AC58'

$FAX_extract    = Join-Path $env:TEMP 'extractFAX'
$PCL_extract    = Join-Path $env:TEMP 'extractPCL'
$PS_extract     = Join-Path $env:TEMP 'extractPS'

$packageArgsPCL = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $PCL_extract
  url           = $urlPCL
  checksum      = $urlPCL_checksum
  checksumType  = 'sha256'
}
$packageArgsFAX = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $FAX_extract
  url           = $urlFAX
  checksum      = $urlFAX_checksum
  checksumType  = 'sha256'
}
$packageArgsPS = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $PS_extract
  url           = $urlPS
  checksum      = $urlPS_checksum
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgsPCL
Install-ChocolateyZipPackage @packageArgsFAX
Install-ChocolateyZipPackage @packageArgsPS

Get-ChildItem $toolsDir -Recurse -Filter "*.inf" | 
ForEach-Object { PNPUtil.exe /add-driver $_.FullName /install }

$pp = Get-PackageParameters
if ($pp.'PCL' -or $pp.'FAX' -or $pp.'PS') { 

	if ($pp.'PCL') { 
	Write-Host "INSTALLING PCL DRIVER"
	Add-PrinterDriver -Name "Generic Universal PCL"
	}

	if ($pp.'FAX') { 
	Write-Host "INSTALLING FAX DRIVER"
	Add-PrinterDriver -Name "Generic Universal FAX"
	}

	if ($pp.'PS') { 
	Write-Host "INSTALLING PS DRIVER"
	Add-PrinterDriver -Name "Generic Universal PS"
	}

} else {
	Write-Host "INSTALLING PCL/FAX/PS DRIVERS"
	Add-PrinterDriver -Name "Generic Universal PCL"
	Add-PrinterDriver -Name "Generic Universal FAX"
	Add-PrinterDriver -Name "Generic Universal PS"
}
