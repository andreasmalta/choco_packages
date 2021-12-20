$ErrorActionPreference = 'Stop';

$PCL64            = 'https://download.support.xerox.com/pub/drivers/GLOBALPRINTDRIVER/drivers/win10x64/ar/UNIV_5.860.1.0_PCL6_x64.zip'
$PCL64_checksum   = '1654C6D69E18055D46A045B72ED2F213A4FAFBBA2C919E6A482524E07E02F1B0'
$PCL86            = 'https://download.support.xerox.com/pub/drivers/GLOBALPRINTDRIVER/drivers/win10/ar/UNIV_5.860.1.0_PCL6_x86.zip'
$PCL86_checksum   = '36F7BDE7500F5B4B61ECB171312D030EC520DC521B3DC5599135C027F64B2498'
$PS64             = 'https://download.support.xerox.com/pub/drivers/VLC8000W/drivers/win10x64/ar/UNIV_5.860.1.0_PS_x64.zip'
$PS64_checksum    = '173087C9DE87056EB6682629C88D59E71708EB703D1D14383B70DE923D715D39'
$PS86             = 'https://download.support.xerox.com/pub/drivers/VLC8000W/drivers/win10/ar/UNIV_5.860.1.0_PS_x86.zip'
$PS86_checksum    = '86BD62F90F3EAFE0262109FECF5E9C304BC6581E5A9384CB4F68878C0E66320B'

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
