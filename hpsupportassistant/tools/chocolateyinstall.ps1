$ErrorActionPreference = 'Stop';
$url            = 'https://ftp.ext.hp.com/pub/softpaq/sp138001-138500/sp138267.exe'
$checksum_url   = 'D48D7A4631AE30107A670D937B74ED56C1B49C94B41F5A004C00FA9FD79CF2BC'

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
