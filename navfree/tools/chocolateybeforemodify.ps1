$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'extract'
Remove-Item $fileLocation -Recurse -Force -ErrorAction Ignore

$navfree = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -like "Autodesk Navisworks Freedom*" }
$navfree.Uninstall()

$matlib = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -like "Autodesk Material Library*" }
$matlib.Uninstall()
