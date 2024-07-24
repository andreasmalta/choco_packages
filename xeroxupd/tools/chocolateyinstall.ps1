$ErrorActionPreference = 'Stop';

$PCL64 = 'https://download.support.xerox.com/pub/drivers/GLOBALPRINTDRIVER/drivers/win10x64/ar/UNIV_5.1009.1.0_PCL6_x64.zip'
$PCL64_checksum = '3FC85D85AB95023F73CA0868EC6BA880FA0F3F1676EADCE7B5B105316C7F6475'
$PCL86 = 'https://download.support.xerox.com/pub/drivers/GLOBALPRINTDRIVER/drivers/win10/ar/UNIV_5.1009.1.0_PCL6_x86.zip'
$PCL86_checksum = 'C416962AB857FC091C7174C14CA3584404556BFA3BDBE0BB3435B28CBE6345FE'
$PS64 = 'https://download.support.xerox.com/pub/drivers/VLC8000W/drivers/win10x64/ar/UNIV_5.1009.1.0_PS_x64.zip'
$PS64_checksum = 'F495CAE0490B2D43786959585CAEA0BB0F788BDD0EDC6BC8E28676BB68EC048B'
$PS86 = 'https://download.support.xerox.com/pub/drivers/VLC8000W/drivers/win10/ar/UNIV_5.1009.1.0_PS_x86.zip'
$PS86_checksum = '2ECEFC80F223D98DF453D0CB24119C89A31933218D480C02FE7BE803E781F643'
$extract = Join-Path $env:TEMP 'extract'

$packageArgsPCL = @{
	packageName    = $env:ChocolateyPackageName
	unzipLocation  = $extract
	url            = $PCL86
	checksum       = $PCL86_checksum
	checksumType   = 'sha256'
	url64bit       = $PCL64
	checksum64     = $PCL64_checksum
	checksumType64 = 'sha256'
}
$packageArgsPS = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation  = $extract
	url            = $PS86
	checksum       = $PS86_checksum
	checksumType   = 'sha256'
	url64bit       = $PS64
	checksum64     = $PS64_checksum
	checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgsPCL
Install-ChocolateyZipPackage @packageArgsPS

$ntprint = Join-Path $extract 'ntprint.inf_*'
Remove-Item $ntprint -Recurse -Force

Get-ChildItem $extract -Recurse -Filter "*.inf" | 
ForEach-Object { PNPUtil.exe /add-driver $_.FullName /install }

Add-PrinterDriver -Name "Xerox Global Print Driver PCL6"
Add-PrinterDriver -Name "Xerox Global Print Driver PS"
