$ErrorActionPreference = 'Stop';
$url            = 'https://ftp.hp.com/pub/softpaq/sp112501-113000/sp112635.exe'
$checksum_url   = '29E44D338737817ACDEEE730F4716C76978F811A98C794BE46F5B8F488D0C66F'

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
