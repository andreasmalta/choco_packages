$fileLocation = Join-Path $env:ChocolateyInstall 'lib\dwgtrueview.install\tools\DWGTrueView*'
Remove-Item $fileLocation -Recurse -Force -ErrorAction Ignore
