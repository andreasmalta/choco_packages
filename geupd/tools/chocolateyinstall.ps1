$ErrorActionPreference = 'Stop';

$FAX            = 'https://dl.develop.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=abc51e992bbfd66b01501a3a5650be84&tx_kmanacondaimport_downloadproxy[documentId]=130166&tx_kmanacondaimport_downloadproxy[system]=Develop&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685'
$FAX_checksum   = '717ACF72D7E78C08692DFF358AB26B8FF619C724CE5ECBB302EBB7DC0E13A0C6'
$PCL            = 'https://dl.develop.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=5ffdde5837d47f0f3609ba164ef67109&tx_kmanacondaimport_downloadproxy[documentId]=130164&tx_kmanacondaimport_downloadproxy[system]=Develop&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685'
$PCL_checksum   = 'B534450729BA5412D0461B359B86BF7958F88519FD5A6F35874BC7D330A0265D'
$PS             = 'https://dl.develop.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=300d00e9bdcf9abc93ee106688cf60d7&tx_kmanacondaimport_downloadproxy[documentId]=130165&tx_kmanacondaimport_downloadproxy[system]=Develop&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685'
$PS_checksum    = '05DD9770970F30ED96C79F8FC26E2D95D017263E2FABE7EF6078003B25BAC449'

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
