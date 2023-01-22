$ErrorActionPreference = 'Stop';

$url = 'https://dl.konicaminolta.eu/en/?tx_kmdownloadcentersite_downloadproxy[fileId]=7f86746b8a2082a5152d3dd65a48292d&tx_kmdownloadcentersite_downloadproxy[documentId]=135985&tx_kmdownloadcentersite_downloadproxy[system]=KonicaMinolta&tx_kmdownloadcentersite_downloadproxy[language]=EN&type=1558521685'
$checksum = 'ED79E30DFB12B4059FDE942C33B299E164D650ACD763D3FD8A4D3563906725AC'
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
