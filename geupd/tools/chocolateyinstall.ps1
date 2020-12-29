$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$urlPCL     = 'https://dl.develop.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=f40f29e43ba544465b56d12920da38bc&tx_kmanacondaimport_downloadproxy[documentId]=126447&tx_kmanacondaimport_downloadproxy[system]=Develop&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685'
$urlPCL_checksum = '8EF211F0D3BEE96721E1FF771E80DC0A3C46350EB75DBC2C65926D5405D83ADC'
$urlPCL5    = 'https://dl.develop.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=77768063984cedf3232e475bfc1ae603&tx_kmanacondaimport_downloadproxy[documentId]=126446&tx_kmanacondaimport_downloadproxy[system]=Develop&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685'
$urlPCL5_checksum = 'BAE939A504DE2A4D58C942092216F26DD3D8F419E28DF60974F89A5ED964D3CB'
$urlPS      = 'https://dl.develop.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=dcbe8b3270c2a8bf0871e4688eea6b52&tx_kmanacondaimport_downloadproxy[documentId]=126448&tx_kmanacondaimport_downloadproxy[system]=Develop&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685'
$urlPS_checksum = 'FCC38DD6FA6CF338A85E2879B797230AFBBD61C53FCBFA7843C44318CCFEC09D'

$packageArgsPCL = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $urlPCL
  checksum      = $urlPCL_checksum
  checksumType  = 'sha256'
}
$packageArgsPCL5 = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $urlPCL5
  checksum      = $urlPCL5_checksum
  checksumType  = 'sha256'
}
$packageArgsPS = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $urlPS
  checksum      = $urlPS_checksum
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgsPCL
Install-ChocolateyZipPackage @packageArgsPCL5
Install-ChocolateyZipPackage @packageArgsPS

Get-ChildItem $toolsDir -Recurse -Filter "*.inf" | 
ForEach-Object { PNPUtil.exe /add-driver $_.FullName /install }

$pp = Get-PackageParameters
if ($pp.'PCL' -or $pp.'PCL5' -or $pp.'PS') { 

	if ($pp.'PCL') { 
	Write-Host "INSTALLING PCL DRIVER"
	Add-PrinterDriver -Name "Generic Universal PCL"
	}

	if ($pp.'PCL5') { 
	Write-Host "INSTALLING PCL5 DRIVER"
	Add-PrinterDriver -Name "Generic Universal PCL5"
	}

	if ($pp.'PS') { 
	Write-Host "INSTALLING PS DRIVER"
	Add-PrinterDriver -Name "Generic Universal PS"
	}

} else {
	Write-Host "INSTALLING PCL/PCL5/PS DRIVERS"
	Add-PrinterDriver -Name "Generic Universal PCL"
	Add-PrinterDriver -Name "Generic Universal PCL5"
	Add-PrinterDriver -Name "Generic Universal PS"
}
