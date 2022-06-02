$ErrorActionPreference = 'Stop';

$PCL            = 'https://dl.develop.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=c5d393830e1ac428eb69bc318fe6912e&tx_kmanacondaimport_downloadproxy[documentId]=133333&tx_kmanacondaimport_downloadproxy[system]=Develop&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685'
$PCL_checksum   = '9110B4FE6721DF9F3C2F2C6E834197336060774F33CC3033F80BD5FA05FA0834'
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
Add-PrinterDriver -Name "Generic Universal V4 PCL"
