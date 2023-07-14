$ErrorActionPreference = 'Stop';

$PCL64 = 'https://download.support.xerox.com/pub/drivers/GLOBALPRINTDRIVER/drivers/win10x64/ar/UNIV_5.951.9.0_PCL6_x64.zip'
$PCL64_checksum = 'C44189BCB2A6E9BF41C80957586EBBAF7E7FDF968E10FE6AE9B7D450BED86C7B'
$PCL86 = 'https://download.support.xerox.com/pub/drivers/GLOBALPRINTDRIVER/drivers/win10/ar/UNIV_5.951.9.0_PCL6_x86.zip'
$PCL86_checksum = '848210804F0A47CE3BDD3E23C603AC5AD5387AE36A1C84ABA1B9DE921BB1AB96'
$PS64 = 'https://download.support.xerox.com/pub/drivers/VLC8000W/drivers/win10x64/ar/UNIV_5.951.9.0_PS_x64.zip'
$PS64_checksum = '399F09D7CE54FAEE35DC6075101D056E331D46295338CAF7C214609F588DF180'
$PS86 = 'https://download.support.xerox.com/pub/drivers/VLC8000W/drivers/win10/ar/UNIV_5.951.9.0_PS_x86.zip'
$PS86_checksum = 'E8C213B127909BF70A6FAAE6B60E01297598CA2BD505F9C3B6DB04A47711E11E'

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
