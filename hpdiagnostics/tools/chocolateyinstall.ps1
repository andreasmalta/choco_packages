$ErrorActionPreference = 'Stop';
$url            = 'https://ftp.hp.com/pub/softpaq/sp112501-113000/sp112517.exe'
$checksum_url   = '22C97A9269395072950037B58C76AD63ACD702D7AEA3152DA2B24F6890EE554C'

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
