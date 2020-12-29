$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$fileLocationPCL = Join-Path $toolsDir 'GEUPDPCL6Win*'
$fileLocationPCL5 = Join-Path $toolsDir 'GEUPDPCL5Win*'
$fileLocationPS = Join-Path $toolsDir 'GEUPDPSWin*'

Remove-Item $fileLocationPCL -Recurse -Force -ErrorAction Ignore
Remove-Item $fileLocationPCL5 -Recurse -Force -ErrorAction Ignore
Remove-Item $fileLocationPS -Recurse -Force -ErrorAction Ignore
