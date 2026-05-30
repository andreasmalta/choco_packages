$ErrorActionPreference = 'Stop';

$PCL64 = 'https://download.support.xerox.com/pub/drivers/GLOBALPRINTDRIVER/drivers/win10x64/ar/UNIV_5.1076.4.0_PCL6_x64.zip'
$PCL64_checksum = '09FCAE9C84572D30656F4CD56AE8B59CEA0D1653B83B8F96256754DC9EABBEAB'
$PCL86 = 'https://download.support.xerox.com/pub/drivers/GLOBALPRINTDRIVER/drivers/win10/ar/UNIV_5.1076.4.0_PCL6_x86.zip'
$PCL86_checksum = '27D8543F9AF8F12259F329B38495E41520AA1D74C9846C16201BA454DBB31307'
$PS64 = 'https://download.support.xerox.com/pub/drivers/VLC8000W/drivers/win10x64/ar/UNIV_5.1076.4.0_PS_x64.zip'
$PS64_checksum = '444A894CED690EEFE708770D6700F276EBC759312929517A11477D620108D4A4'
$PS86 = 'https://download.support.xerox.com/pub/drivers/VLC8000W/drivers/win10/ar/UNIV_5.1076.4.0_PS_x86.zip'
$PS86_checksum = '83BC0EEB04A75FDB9950647CD751548F4EAAA510EA62FE7825868A53D6377BAC'
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
