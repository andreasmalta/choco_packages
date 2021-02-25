$ErrorActionPreference = 'Stop';

$url            = 'https://barcoprdwebsitefs.azureedge.net/barcoprdfs/Data/secure/downloads/tde/Active/SoftwareFiles/ApplicationSoftware/R3306194_20_ApplicationSw.zip?y7XWWRosPHvhifajyxUn4h7C4HrY2CP8V3m2Kyy7WJf9q51saByYvfojtM0eVV1XRevzXZZX8b110KV59XsVSgase9o0'
$checksum_url   = 'DD777B1A930CD7DFF507BC8CDE3485A7B43E4E986F25736C001540FE731846E0'
$file           = Join-Path $env:TEMP 'ClickShare_Installer.msi'

$packageArgsURL = @{
  packageName   = $env:ChocolateyPackageName
  file          = $url
  checksum      = $checksum_url
  checksumType  = 'sha256'
  unziplocation = $env:TEMP
}
Install-ChocolateyZipPackage @packageArgsURL

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  file          = $file
  softwareName  = 'clickshare*'
  silentArgs    = "/qn ACCEPT_EULA=YES /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}
Install-ChocolateyPackage @packageArgs
