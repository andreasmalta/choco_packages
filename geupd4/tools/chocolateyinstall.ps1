$ErrorActionPreference = 'Stop';

$url = 'https://dl.develop.eu/en/?tx_kmdownloadcentersite_downloadproxy[fileId]=1f8942880796fbe48ed330240f6578b8&tx_kmdownloadcentersite_downloadproxy[documentId]=141510&tx_kmdownloadcentersite_downloadproxy[system]=Develop&tx_kmdownloadcentersite_downloadproxy[language]=EN&type=1558521685'
$checksum = '5D72874F9E900C63E76FCED917838E252B656CC465858A02D9324478C2558A03'
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
