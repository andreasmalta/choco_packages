$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'DWGTrueView*'

Start-Process -FilePath "msiexec.exe" -ArgumentList "/x {28B89EEF-3028-0409-0100-CF3F3A09B77D} /qn /norestart" -Wait
Start-Process -FilePath "msiexec.exe" -ArgumentList "/x {28B89EEF-4128-0409-0100-CF3F3A09B77D} /qn /norestart" -Wait
Remove-Item $fileLocation -Recurse -Force -ErrorAction Ignore
