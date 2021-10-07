$ErrorActionPreference = 'Stop';

$FAX            = 'https://dl.develop.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=c0365c7739dd5be9d95af1b233a09293&tx_kmanacondaimport_downloadproxy[documentId]=129422&tx_kmanacondaimport_downloadproxy[system]=Develop&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685'
$FAX_checksum   = '2F028CDC756E9F98892CB9CE78118496563257D27053303830F04B0050B1C7C1'
$PCL            = 'https://dl.develop.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=3781038422c14d7b0b65bb678a983de8&tx_kmanacondaimport_downloadproxy[documentId]=129423&tx_kmanacondaimport_downloadproxy[system]=Develop&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685'
$PCL_checksum   = '4330DB1F2BF3313E8DD88729EB0D0E49AAEAB80B598A0C53015F89B5BD56016E'
$PS             = 'https://dl.develop.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=4af03c9451268c8908628972511516f8&tx_kmanacondaimport_downloadproxy[documentId]=129424&tx_kmanacondaimport_downloadproxy[system]=Develop&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685'
$PS_checksum    = 'E1B86648C27909D773B136450A5B535BA86A834AA2954D8B2161AFBB9491AC58'

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
	Add-PrinterDriver -Name "Generic Universal FAX"
	}

	if ($pp.'PCL') { 
	Write-Host "INSTALLING PCL DRIVER"
	Install-ChocolateyZipPackage @packageArgsPCL
	Get-ChildItem $PCL_extract -Recurse -Filter "*.inf" | 
	ForEach-Object { PNPUtil.exe /add-driver $_.FullName /install }
	Add-PrinterDriver -Name "Generic Universal PCL"
	}

	if ($pp.'PS') { 
	Write-Host "INSTALLING PS DRIVER"
	Install-ChocolateyZipPackage @packageArgsPS
	Get-ChildItem $PS_extract -Recurse -Filter "*.inf" | 
	ForEach-Object { PNPUtil.exe /add-driver $_.FullName /install }
	Add-PrinterDriver -Name "Generic Universal PS"
	}

} else {
	Write-Host "INSTALLING FAX/PCL/PS DRIVERS"

	Install-ChocolateyZipPackage @packageArgsFAX
	Get-ChildItem $FAX_extract -Recurse -Filter "*.inf" | 
	ForEach-Object { PNPUtil.exe /add-driver $_.FullName /install }
	Add-PrinterDriver -Name "Generic Universal FAX"

	Install-ChocolateyZipPackage @packageArgsPCL
	Get-ChildItem $PCL_extract -Recurse -Filter "*.inf" | 
	ForEach-Object { PNPUtil.exe /add-driver $_.FullName /install }
	Add-PrinterDriver -Name "Generic Universal PCL"

	Install-ChocolateyZipPackage @packageArgsPS
	Get-ChildItem $PS_extract -Recurse -Filter "*.inf" | 
	ForEach-Object { PNPUtil.exe /add-driver $_.FullName /install }
	Add-PrinterDriver -Name "Generic Universal PS"
}
