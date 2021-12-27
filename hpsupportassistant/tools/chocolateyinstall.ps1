$ErrorActionPreference = 'Stop';
$url            = 'https://ftp.ext.hp.com/pub/softpaq/sp136501-137000/sp136727.exe'
$checksum_url   = '1D1DDD79B469F645004F7CB47283A58783695DC9E1D44D17F26B01BACFDB1275'

$packageArgsURL = @{
  packageName   = $env:ChocolateyPackageName
  file          = $url
  checksum      = $checksum_url
  checksumType  = 'sha256'
  unziplocation = $env:TEMP
}
Install-ChocolateyZipPackage @packageArgsURL

#apparently needs to open in a new window otherwise it closes down the choco process (start-process -wait)
#apparently needs to run from the same directory to work (cd $env:temp)
cd $env:TEMP; Start-Process -Wait -FilePath ".\Setup.exe" -ArgumentList "-s"
