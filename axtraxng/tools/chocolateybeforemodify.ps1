$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$extract_url = Join-Path $toolsDir 'zip'
$extract_exe = Join-Path $toolsDir 'exe'
Remove-Item $extract_url -Recurse -Force -ErrorAction Ignore
Remove-Item $extract_exe -Recurse -Force -ErrorAction Ignore

$packageArgsConfigTool = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'AxTraxNG Configuration Tool'
}
Uninstall-ChocolateyPackage @packageArgsConfigTool
