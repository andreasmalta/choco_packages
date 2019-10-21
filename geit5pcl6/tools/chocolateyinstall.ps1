$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://dl.develop.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=fda2b9f7de235182ba423627216161f0&tx_kmanacondaimport_downloadproxy[documentId]=1483&tx_kmanacondaimport_downloadproxy[system]=Develop&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685'
$url64      = 'https://dl.develop.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=31153230a299b1c3939e5518e04e20a9&tx_kmanacondaimport_downloadproxy[documentId]=1482&tx_kmanacondaimport_downloadproxy[system]=Develop&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE_MSI_OR_MSU' #only one of these: exe, msi, msu
  url           = $url
  url64bit      = $url64
  checksum      = 'C95A5AE3A115346BEE4944E8DA1CBBF7449BF8DE32AA6A95E9803012BEFBDC64'
  checksumType  = 'sha256'
  checksum64    = '739C32D531F02DAE8FCE641903610B14221DFD72C59CD2F813B0BC37BB85D16F'
  checksumType64= 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
