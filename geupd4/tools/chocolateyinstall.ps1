$ErrorActionPreference = 'Stop';

$url = 'https://dl.develop.eu/en/?tx_kmdownloadproxy_downloadproxy[fileId]=55255c9bcfa04086abab62bd45ea97c0&tx_kmdownloadproxy_downloadproxy[documentId]=145289&tx_kmdownloadproxy_downloadproxy[system]=Develop&tx_kmdownloadproxy_downloadproxy[language]=EN&type=1558521685'
$checksum = 'BBC7422DDAC96F931995BB11F288DE7DE6D3DB626545D3F183A335779E217C48'
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
