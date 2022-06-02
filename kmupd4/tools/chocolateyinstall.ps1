$ErrorActionPreference = 'Stop';

$PCL            = 'https://dl.konicaminolta.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=fafa5a1e8eb7f584fab4d830027232f5&tx_kmanacondaimport_downloadproxy[documentId]=133332&tx_kmanacondaimport_downloadproxy[system]=KonicaMinolta&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685'
$PCL_checksum   = 'E04400C8F6076D5BE4AE4F0882E088D4148811FD7877B1FD31CEC6B9522D83A5'
$PCL_extract    = Join-Path $env:TEMP 'extractPCL'

$packageArgsPCL = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $PCL_extract
	url           = $PCL
	checksum      = $PCL_checksum
	checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgsPCL
Get-ChildItem $PCL_extract -Recurse -Filter "*.inf" | 
ForEach-Object { PNPUtil.exe /add-driver $_.FullName /install }
Add-PrinterDriver -Name "KONICA MINOLTA Universal V4 PCL"
