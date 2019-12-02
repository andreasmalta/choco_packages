$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://dl.konicaminolta.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=518dd3f48e952f48c9dc19a1ca1aae15&tx_kmanacondaimport_downloadproxy[documentId]=102461&tx_kmanacondaimport_downloadproxy[system]=KonicaMinolta&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685'
$url64      = 'https://dl.konicaminolta.eu/en/?tx_kmanacondaimport_downloadproxy[fileId]=1c59526e5a05786fa3209e3825f8e1e7&tx_kmanacondaimport_downloadproxy[documentId]=102464&tx_kmanacondaimport_downloadproxy[system]=KonicaMinolta&tx_kmanacondaimport_downloadproxy[language]=EN&type=1558521685'
$driverFile = Get-ChildItem $toolsDir -Recurse -Filter "koaytj__.cat"
$exportType = [System.Security.Cryptography.X509Certificates.X509ContentType]::Cert
$drivercert = Join-Path $toolsDir 'koaytj__.cer'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  url64bit      = $url64
  checksum      = '757C80DCD13D71F1EC09065BDB8F1E0F6994B773231440C008107DCAF4E3C78E'
  checksumType  = 'sha256'
  checksum64    = '211852B7B792A2DD1605BE6F0F49A00247D9C849115020F0DE28A1FFE4D1569D'
  checksumType64= 'sha256'
}

$cert = (Get-AuthenticodeSignature $driverFile).SignerCertificate;
[System.IO.File]::WriteAllBytes($drivercert, $cert.Export($exportType));
certutil -addstore "TrustedPublisher" $drivercert

Install-ChocolateyZipPackage @packageArgs

Get-ChildItem $toolsDir -Recurse -Filter "*.inf" | 
ForEach-Object { PNPUtil.exe /add-driver $_.FullName /install }

$pp = Get-PackageParameters

if ($pp.'C364' -or $pp.'C554') { 

	if ($pp.'C364') { 
	Write-Host "Installing KONICA MINOLTA C364SeriesPCL"
	Add-PrinterDriver -Name "KONICA MINOLTA C364SeriesPCL"
	$all = $all + 1
	}

	if ($pp.'C554') { 
	Write-Host "Installing KONICA MINOLTA C554SeriesPCL"
	Add-PrinterDriver -Name "KONICA MINOLTA C554SeriesPCL"
	$all = $all + 1
	}

} else {
	Write-Host "Installing all drivers from package"
	Add-PrinterDriver -Name "KONICA MINOLTA C364SeriesPCL"
	Add-PrinterDriver -Name "KONICA MINOLTA C554SeriesPCL"
}
