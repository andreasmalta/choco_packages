$ErrorActionPreference = 'Stop';

$PCL            = 'https://dl.develop.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=d63da384eb573729d113f3202e93f321&tx_kmanacondaimport_downloadproxy[documentId]=130167&tx_kmanacondaimport_downloadproxy[system]=Develop&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685'
$PCL_checksum   = '3B63B030EFAD04502CF02CD8EBFC033C281C3725451020C63819BF3FDCD0139F'
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
