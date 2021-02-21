$ErrorActionPreference = 'Stop';

#support assistant upgrade & uninstallation is not silent
Start-Process -Wait -FilePath "C:\Program Files (x86)\Hewlett-Packard\HP Support Framework\UninstallHPSA.exe" -ArgumentList "/s /v /qn"
