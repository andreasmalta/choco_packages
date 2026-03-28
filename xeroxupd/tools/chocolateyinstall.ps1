$ErrorActionPreference = 'Stop';

$PCL64 = 'https://download.support.xerox.com/pub/drivers/GLOBALPRINTDRIVER/drivers/win10x64/ar/UNIV_5.1076.3.0_PCL6_x64.zip'
$PCL64_checksum = '8516A55AAD5C5406CF5DA5DE998897FCB7CFD5D99724C221AFA519F5317F7F68'
$PCL86 = 'https://download.support.xerox.com/pub/drivers/GLOBALPRINTDRIVER/drivers/win10/ar/UNIV_5.1076.3.0_PCL6_x86.zip'
$PCL86_checksum = '1B9D94F5E69AC93E75D2E1C384389958E18317334BBA39CE78B8B19819B1D04B'
$PS64 = 'https://download.support.xerox.com/pub/drivers/VLC8000W/drivers/win10x64/ar/UNIV_5.1076.3.0_PS_x64.zip'
$PS64_checksum = '90D79E7E1E6908469C9340180161FA2C072FAAB7E86788A774541D08B855E2C3'
$PS86 = 'https://download.support.xerox.com/pub/drivers/VLC8000W/drivers/win10/ar/UNIV_5.1076.3.0_PS_x86.zip'
$PS86_checksum = '646D6428385E906A120D9A772AD251E1A6C9A959FB11E583CE5BB7DBA9A11C2F'
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
