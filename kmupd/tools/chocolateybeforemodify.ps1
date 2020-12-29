$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'UPDMSIWin*'
Remove-Item $fileLocation -Recurse -Force -ErrorAction Ignore
