$ErrorActionPreference = 'Stop';

$url = 'https://dl.develop.eu/en/?tx_kmdownloadcentersite_downloadproxy[fileId]=6b099422020e119567797cfe1939cb0a&tx_kmdownloadcentersite_downloadproxy[documentId]=136115&tx_kmdownloadcentersite_downloadproxy[system]=Develop&tx_kmdownloadcentersite_downloadproxy[language]=EN&type=1558521685'
$checksum = 'B1D370DC448B09BB3311CBBDEA9B312B9E5183E0BD73C98EB23C5F74392FE3F6'
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
