$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'BHC554e*'

Remove-Item $fileLocation -Recurse -Force -ErrorAction Ignore
