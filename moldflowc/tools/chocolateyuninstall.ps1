$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#UNINSTALL
. $toolsDir\helpers.ps1
Invoke-UninstallOldMFC
