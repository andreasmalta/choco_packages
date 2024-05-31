$ErrorActionPreference = 'Stop';

$url = 'https://dl.konicaminolta.eu/en/?tx_kmdownloadcentersite_downloadproxy[fileId]=d005d4adafcecf06fb13e0e529f710b9&tx_kmdownloadcentersite_downloadproxy[documentId]=141880&tx_kmdownloadcentersite_downloadproxy[system]=KonicaMinolta&tx_kmdownloadcentersite_downloadproxy[language]=EN&type=1558521685'
$checksum = '0AF2E674B71F484F4F94CDF3FA216AF2B59797F868324D647DDB40138A433386'
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
