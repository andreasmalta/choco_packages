$ErrorActionPreference = 'Stop';

$PCL64            = 'https://download.support.xerox.com/pub/drivers/GLOBALPRINTDRIVER/drivers/win10x64/ar/UNIV_5.810.8.0_PCL6_x64.zip'
$PCL64_checksum   = 'A01C059E051BFE0911A8A0B7EF925289CEE2BD25AE6C852B95C66D2158757218'
$PCL86            = 'https://download.support.xerox.com/pub/drivers/GLOBALPRINTDRIVER/drivers/win10/ar/UNIV_5.810.8.0_PCL6_x86.zip'
$PCL86_checksum   = '8507D95A5F504DF4D2C5EC3F9D0AED1F236A7A9E5D14A62E75D08BAF1B1DDB9A'
$PS64             = 'https://download.support.xerox.com/pub/drivers/GLOBALPRINTDRIVER/drivers/win10x64/ar/UNIV_5.810.8.0_PS_x64.zip'
$PS64_checksum    = 'E13CF15F86367152A614B350B9A2DCB2000D21D85219927C673F7A794A1C2A70'
$PS86             = 'https://download.support.xerox.com/pub/drivers/GLOBALPRINTDRIVER/drivers/win10/ar/UNIV_5.810.8.0_PS_x86.zip'
$PS86_checksum    = 'DD27188D768DEF3948E1E98AE01DBA4588C39A2687EA000F90E7D7D305910851'

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
