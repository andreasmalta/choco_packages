$ErrorActionPreference = 'Stop';

$PCL64 = 'https://download.support.xerox.com/pub/drivers/GLOBALPRINTDRIVER/drivers/win10x64/ar/UNIV_5.1055.3.0_PCL6_x64.zip'
$PCL64_checksum = '35E97C13575EFF320FAAE0A717B801E155CFF01EF8E7D49A1F4D6719275FF0A9'
$PCL86 = 'https://download.support.xerox.com/pub/drivers/GLOBALPRINTDRIVER/drivers/win10/ar/UNIV_5.1055.3.0_PCL6_x86.zip'
$PCL86_checksum = '32E0A42BBAAB7951495887AC005D407B1E993C250919FEED563479B4BB5B1A37'
$PS64 = 'https://download.support.xerox.com/pub/drivers/VLC8000W/drivers/win10x64/ar/UNIV_5.1055.3.0_PS_x64.zip'
$PS64_checksum = 'E1702443AD67F52CC8B5BD76B142053B4BB96A8EE70AE08ADD3EAEB0E84E7E20'
$PS86 = 'https://download.support.xerox.com/pub/drivers/VLC8000W/drivers/win10/ar/UNIV_5.1055.3.0_PS_x86.zip'
$PS86_checksum = '1025E646868883E0FF0DF29F6870D108CB9F5BCF5399E8BB8C69BA6C38CD62A8'
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
