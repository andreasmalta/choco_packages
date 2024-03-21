$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

. $toolsDir\helpers.ps1
Invoke-Uninstall

$url = 'https://ftp.hp.com/pub/softpaq/sp151501-152000/sp151723.exe'
$checksum = '9207853DCBE6EFBCD2BE7BF1E150438367EFEC3673A828B1A8A7B6E4D3AA935B'

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
