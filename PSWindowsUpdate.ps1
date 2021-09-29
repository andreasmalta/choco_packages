Install-PackageProvider -Name NuGet -Force
Install-Module -Name PSWindowsUpdate -force
Set-ExecutionPolicy RemoteSigned -force
Import-Module -Name PSWindowsUpdate
Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -AutoReboot
