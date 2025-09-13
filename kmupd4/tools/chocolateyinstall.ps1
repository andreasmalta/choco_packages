$ErrorActionPreference = 'Stop';

$url = 'https://dl.konicaminolta.eu/en/?tx_kmdownloadproxy_downloadproxy[fileId]=22bd63a26b3f15bed9ce8e36d531b842&tx_kmdownloadproxy_downloadproxy[documentId]=145283&tx_kmdownloadproxy_downloadproxy[system]=KonicaMinolta&tx_kmdownloadproxy_downloadproxy[language]=EN&type=1558521685'
$checksum = '60C54B99660FDADEF924024B595D4612534AF35F9399BBCE483999B9FD61E8B9'
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
