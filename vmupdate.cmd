choco upgrade all -y
powershell.exe -Command "&{Install-PackageProvider -Name NuGet -Force; Install-Module -Name PSWindowsUpdate -force; Set-ExecutionPolicy RemoteSigned -force; Import-Module -Name PSWindowsUpdate; Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -AutoReboot}"
cleanmgr /verylowdisk /sagerun:1
defrag C:
