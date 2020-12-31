$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'DWGTrueView*'
Remove-Item $fileLocation -Recurse -Force -ErrorAction Ignore

#Uninstall older versions:
#DWG TrueView 2021 - English
#DWG TrueView 2021 - Français (French)
#DWG TrueView 2021 - 日本語 (Japanese)
$app = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -like "DWG TrueView*" }
$app.Uninstall()
