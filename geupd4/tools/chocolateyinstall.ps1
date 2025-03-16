$ErrorActionPreference = 'Stop';

$url = 'https://dl.develop.eu/en/?tx_kmdownloadcentersite_downloadproxy[fileId]=5608d652644743433c4995e6fdc2334e&tx_kmdownloadcentersite_downloadproxy[documentId]=141885&tx_kmdownloadcentersite_downloadproxy[system]=Develop&tx_kmdownloadcentersite_downloadproxy[language]=EN&type=1558521685'
$checksum = 'D8C0F132A816FF1FA90CA698B62558FC78A76BA2890BB3ECE53E6B7CCDF97BA8'
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
Add-PrinterDriver -Name "Generic Universal V4 PCL"
