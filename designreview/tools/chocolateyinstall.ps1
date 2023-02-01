$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url      = 'https://download.autodesk.com/us/support/files/designreview/2018/EXE/enu/SetupDesignReview.exe'
$checksum_url    = '5258D6F5C26FE59A245A2540ADD6E49CC80025EEA48289F3ED30424EB83F3325'
$extract = Join-Path $toolsDir 'setup'
$file = Join-Path $toolsDir 'setup\x86\ADR\SetupDesignReview.msi'
$checksum_file    = 'A54C237AAAC1570965AC61FAB480658A413955CD2151EAE02759D1F35A1CDAE1'

$packageArgs1 = @{
  packageName   = $env:ChocolateyPackageName
  url           = $url
  checksum      = $checksum_url
  checksumType  = 'sha256'
  unziplocation = $extract
}
Install-ChocolateyZipPackage @packageArgs1

$packageArgs2 = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  file          = $file
  softwareName  = 'designreview*'
  checksum      = $checksum_file
  checksumType  = 'sha256'
  silentArgs    = "ALLUSERS=1 /q"
  validExitCodes= @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgs2
