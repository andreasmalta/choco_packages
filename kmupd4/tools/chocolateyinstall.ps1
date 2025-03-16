$ErrorActionPreference = 'Stop';

$url = 'https://dl.konicaminolta.eu/en/?tx_kmdownloadcentersite_downloadproxy[fileId]=a7b3df29e2d2863c88c0f006d3d64db6&tx_kmdownloadcentersite_downloadproxy[documentId]=144405&tx_kmdownloadcentersite_downloadproxy[system]=KonicaMinolta&tx_kmdownloadcentersite_downloadproxy[language]=EN&type=1558521685'
$checksum = '2A52C2E152A88C995E64022D26F499733121981FF58DDCE065B762B1EF01BC4D'
$extract = Join-Path $env:TEMP 'extractPCL'

$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $extract
	url           = $url
	checksum      = $checksum
	checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Get-ChildItem $extract -Recurse -Filter "*.inf" | 
ForEach-Object { PNPUtil.exe /add-driver $_.FullName /install }
Add-PrinterDriver -Name "KONICA MINOLTA Universal V4 PCL"
