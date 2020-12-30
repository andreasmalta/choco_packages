$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$pp = Get-PackageParameters

if ($pp.'FRENCH') { 
	Write-Host "FRENCH"
	$urlFRENCH    = 'https://raw.githubusercontent.com/andreasmalta/choco_packages/master/test/FRENCH.txt'
	$urlFRENCH_checksum = 'F792C0B5EF6EA349E8906E17B21D6AE6AC2596262270BD45B0EED5B9CF9548F5'
	$packageArgsFRENCH = @{
		packageName   = $env:ChocolateyPackageName
		unzipLocation = $toolsDir
		url           = $urlFRENCH
		checksum      = $urlFRENCH_checksum
		checksumType  = 'sha256'
	}

} elseif ($pp.'JAPANESE') { 
	Write-Host "JAPANESE"
	$urlJAPANESE    = 'https://raw.githubusercontent.com/andreasmalta/choco_packages/master/test/JAPANESE.txt'
	$urlJAPANESE_checksum = '67695698B17762480AA73247A9011D114176C32EADA60722DBDDB7B9DF2C70C9'
	$packageArgsJAPANESE = @{
		packageName   = $env:ChocolateyPackageName
		unzipLocation = $toolsDir
		url           = $urlJAPANESE
		checksum      = $urlJAPANESE_checksum
		checksumType  = 'sha256'
	}

} else {
	Write-Host "ENGLISH"
	$urlENGLISH     = 'https://raw.githubusercontent.com/andreasmalta/choco_packages/master/test/ENGLISH.txt'
	$urlENGLISH_checksum = 'EE56C51F554915FBC0DCA59E8CEA774B91E932D8BB6995C6E0E10073F9D83D34'
	$packageArgsENGLISH = @{
		packageName   = $env:ChocolateyPackageName
		unzipLocation = $toolsDir
		url           = $urlENGLISH
		checksum      = $urlENGLISH_checksum
		checksumType  = 'sha256'
	}
}
