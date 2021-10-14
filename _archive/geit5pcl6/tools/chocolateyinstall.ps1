$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://dl.develop.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=f2a8c5c610bf613c8e918fb541cf294a&tx_kmanacondaimport_downloadproxy[documentId]=6502&tx_kmanacondaimport_downloadproxy[system]=Develop&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685'
$url64      = 'https://dl.develop.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=87eb1789be0bcb9095fc722992bc46b6&tx_kmanacondaimport_downloadproxy[documentId]=6503&tx_kmanacondaimport_downloadproxy[system]=Develop&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  url64bit      = $url64
  checksum      = '29375A736DB46FC3764021B50924DBB3A89B6E7B02C431CD2EE43AFD704C5FF5'
  checksumType  = 'sha256'
  checksum64    = '07FD1B0D0B73EAC864320367E45CFB0D20984BED7671A93F0ABE1463739E0E51'
  checksumType64= 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

Get-ChildItem $toolsDir -Recurse -Filter "*.inf" | 
ForEach-Object { PNPUtil.exe /add-driver $_.FullName /install }

$pp = Get-PackageParameters

if ($pp.'28C' -or $pp.'36C' -or $pp.'65C' -or $pp.'70C' -or $pp.'MF385') { 

	if ($pp.'28C') { 
	Write-Host "Installing Generic 28C-8SeriesPCL"
	Add-PrinterDriver -Name "Generic 28C-8SeriesPCL"
	$all = $all + 1
	}

	if ($pp.'36C') { 
	Write-Host "Installing Generic 36C-9SeriesPCL"
	Add-PrinterDriver -Name "Generic 36C-9SeriesPCL"
	$all = $all + 1
	}

	if ($pp.'65C') { 
	Write-Host "Installing Generic 65C-9SeriesPCL"
	Add-PrinterDriver -Name "Generic 65C-9SeriesPCL"
	$all = $all + 1
	}

	if ($pp.'70C') { 
	Write-Host "Installing Generic 70C-10SeriesPCL"
	Add-PrinterDriver -Name "Generic 70C-10SeriesPCL"
	$all = $all + 1
	}

	if ($pp.'MF385') { 
	Write-Host "Installing Generic C MF385-2SeriesPCL"
	Add-PrinterDriver -Name "Generic C MF385-2SeriesPCL"
	$all = $all + 1
	}
	
} else {
	Write-Host "Installing all drivers from package"
	Add-PrinterDriver -Name "Generic 28C-8SeriesPCL"
	Add-PrinterDriver -Name "Generic 36C-9SeriesPCL"
	Add-PrinterDriver -Name "Generic 65C-9SeriesPCL"
	Add-PrinterDriver -Name "Generic 70C-10SeriesPCL"
	Add-PrinterDriver -Name "Generic C MF385-2SeriesPCL"
}
