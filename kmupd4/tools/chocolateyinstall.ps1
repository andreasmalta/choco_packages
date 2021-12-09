$ErrorActionPreference = 'Stop';

$PCL            = 'https://dl.konicaminolta.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=4bdfc9dbead1ee58262a0b364faf59a6&tx_kmanacondaimport_downloadproxy[documentId]=129831&tx_kmanacondaimport_downloadproxy[system]=KonicaMinolta&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685'
$PCL_checksum   = 'CE7758FD48A5812AA334B638E813AF84CB6B32CF7D8F4C677C765064C6DA4D0F'
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
