$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$version    = Join-Path $toolsDir 'UPDMSIWin_3700MU'
$url        = 'https://dl.konicaminolta.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=64eb23f0395f6e5cef8aedaaf2851d2a&tx_kmanacondaimport_downloadproxy[documentId]=125642&tx_kmanacondaimport_downloadproxy[system]=KonicaMinolta&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685'
$url_checksum = '02F2C609FB6A0B2F50001579AEC4A75947D6439867D3B0B9AA4FF8156434E908'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = $url_checksum
  checksumType  = 'sha256'
  url64bit      = $url
  checksum64    = $url_checksum
  checksumType64= 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$file_PCL = Join-Path $version 'Universal_PCL6_x86_driver.msi'
$file64_PCL = Join-Path $version 'Universal_PCL6_x64_driver.msi'
$checksum_PCL = '3A92112E391B023E4C698C668DDAD8D3E1699CC9FACE1CCB79DC2D72030285D4'
$checksum64_PCL = '009A4108DA2CE8CB2F48916214A72C8560A11ADCA97A4AE4A8A1007788EA17AA'
$file_PCL5 = Join-Path $version 'Universal_PCL5_x86_driver.msi'
$file64_PCL5 = Join-Path $version 'Universal_PCL5_x64_driver.msi'
$checksum_PCL5 = '34619A316D34DDDCA8E260BD6DFA91D624709D343547DD1F9E033BC3A2AE95DD'
$checksum64_PCL5 = '97854BA8DA738EBEA301BA1E9F5960D05D670A0F1F5BB042AD8D1C09B688A0EC'
$file_PS = Join-Path $version 'Universal_PS_x86_driver.msi'
$file64_PS = Join-Path $version 'Universal_PS_x64_driver.msi'
$checksum_PS = '2A3BF141E7784C29C246D89FE313179E970F33CF1511BD728BE212A43F889A48'
$checksum64_PS = 'FABB0FF49D125233071C517551831C100C3FB748B0D018BAF83CC004C579EAEC'

$packageArgsPCL = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
  softwareName  = 'Universal PCL6*'
  file          = $file_PCL
  file64        = $file64_PCL
  checksum      = $checksum_PCL
  checksumType  = 'sha256'
  checksum64    = $checksum64_PCL
  checksumType64= 'sha256'
}

$packageArgsPCL5 = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
  softwareName  = 'Universal PCL5*'
  file          = $file_PCL5
  file64        = $file64_PCL5
  checksum      = $checksum_PCL5
  checksumType  = 'sha256'
  checksum64    = $checksum64_PCL5
  checksumType64= 'sha256'
}

$packageArgsPS = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
  softwareName  = 'Universal PS*'
  file          = $file_PS
  file64        = $file64_PS
  checksum      = $checksum_PS
  checksumType  = 'sha256'
  checksum64    = $checksum64_PS
  checksumType64= 'sha256'
}

$pp = Get-PackageParameters
if ($pp.'PCL' -or $pp.'PCL5' -or $pp.'PS') { 

	if ($pp.'PCL') { 
	Write-Host "INSTALLING PCL6 DRIVER"
	Install-ChocolateyPackage @packageArgsPCL
	}

	if ($pp.'PCL5') { 
	Write-Host "INSTALLING PCL5 DRIVER"
	Install-ChocolateyPackage @packageArgsPCL5
	}

	if ($pp.'PS') { 
	Write-Host "INSTALLING PS DRIVER"
	Install-ChocolateyPackage @packageArgsPS
	}

} else {
	Write-Host "INSTALLING PCL/PCL5/PS DRIVERS"
	Install-ChocolateyPackage @packageArgsPCL
	Install-ChocolateyPackage @packageArgsPCL5
	Install-ChocolateyPackage @packageArgsPS
}
