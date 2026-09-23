$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

. $toolsDir\helpers.ps1
Invoke-Uninstall

$url = 'https://ftp.hp.com/pub/softpaq/sp174001-174500/sp174448.exe'
$checksum = '20ADEE89A8720497840F1706FA00FD84DF85BA393AF8081A16EEDD9D6EEA278C'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  file          = $url
  checksum      = $checksum
  checksumType  = 'sha256'
  unziplocation = $env:TEMP
}
Install-ChocolateyZipPackage @packageArgs

#apparently needs to open in a new window otherwise it closes down the choco process (start-process -wait)
#apparently needs to run from the same directory to work ($env:temp)
cd $env:TEMP; Start-Process -Wait -FilePath ".\Setup.exe" -ArgumentList "-s"
