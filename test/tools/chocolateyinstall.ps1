$ErrorActionPreference = 'Stop';
$pp = Get-PackageParameters

if ($pp.'FRENCH') { 
	Write-Host "FRENCH"
} elseif ($pp.'JAPANESE') { 
	Write-Host "JAPANESE"
} else {
	Write-Host "ENGLISH"
}
