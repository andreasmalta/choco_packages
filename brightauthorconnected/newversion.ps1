#$version = Read-Host -Prompt 'Input the latest version number'
#$url = "https://www.brightsignnetwork.com/download/ba-connected-builds/ba-connected-prod/BA%20connected%20Setup%20" + $version + ".exe"
$file = Join-Path $env:TEMP 'BAconnectedSetup.exe'
$nuspec = "brightauthorconnected.nuspec"
$install = "tools\chocolateyinstall.ps1"

#Invoke-WebRequest -URI $url -OutFile $file
$checksum = (Get-FileHash $file).Hash

#$nuspecversion = "<version>" + $version + "</version>"
#(Get-Content $nuspec) -replace '<version>.*', $nuspecversion | Set-Content $nuspec

$installchecksum = "checksum = '" + $checksum + "'"
(Get-Content $install) -replace 'checksum =.*', $installchecksum | Set-Content $install
