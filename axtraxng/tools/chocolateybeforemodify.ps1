$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$extract_url = Join-Path $toolsDir 'axtraxng-master'
Remove-Item $extract_url -Recurse -Force -ErrorAction Ignore

[array]$key = Get-UninstallRegistryKey -SoftwareName "AxTraxNG Configuration Tool"
$key.UninstallString
