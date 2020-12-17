$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url      = 'https://brightsignbiz.s3.amazonaws.com/brightauthor/4.7/4.7.2.18/setup_BrightAuthor_4.7.2.18.zip'
$checksum_url    = '8660F92152DA110CD589DB5AF0718FBE672E0BC1AA9847E33D7B6E2840ADA0C4'
$extract = Join-Path $toolsDir 'unzip'
$file = Join-Path $toolsDir 'unzip\setup.4.7.2.18.exe'
$checksum_file    = 'EC61640CA19CD915B264058198237802477D3B44B4D62B35A654087AA31B8C03'

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
  fileType      = 'exe'
  file          = $file
  softwareName  = 'BrightAuthor*'
  checksum      = $checksum_file
  checksumType  = 'sha256'
  silentArgs    = "/S"
  validExitCodes= @(0, 3010, 1641)
}
Install-ChocolateyInstallPackage @packageArgs2
