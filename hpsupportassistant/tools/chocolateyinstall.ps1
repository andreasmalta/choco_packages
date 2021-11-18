$ErrorActionPreference = 'Stop';
$url            = 'https://ftp.ext.hp.com/pub/softpaq/sp136001-136500/sp136195.exe'
$checksum_url   = 'FEAA2AD599F70F0EC5D01BE9C0AA4F9E51D6EF880541B18C0898B0B87980D20F'

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
