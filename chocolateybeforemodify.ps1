$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'GEIT5*'

Remove-Item $fileLocation -Recurse -Force -ErrorAction Ignore
