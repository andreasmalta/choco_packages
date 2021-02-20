$ErrorActionPreference = 'Stop';

#$url            = 'https://ftp.hp.com/pub/softpaq/sp111501-112000/sp111562.exe'
$url            = 'C:\temp\sp111562.exe'
$checksum_url   = '0052CA213A8B1A8A6BC77102160DC529FF24BD14337510CCDDC73C9EA7469692'
$packageArgsURL = @{
  packageName   = $env:ChocolateyPackageName
  file          = $url
  checksum      = $checksum_url
  checksumType  = 'sha256'
  unziplocation = $env:TEMP
}
Install-ChocolateyZipPackage @packageArgsURL

#run setup from directory
cd $env:TEMP; Start-Process -Wait -FilePath ".\Setup.exe" -ArgumentList "-s"
