#Create Functions similar to the one below for additional apps

function Install-VSCode {
    Write-Host "Installing VS Code on $env:COMPUTERNAME"
    Start-Process -FilePath "Z:\VSCode\VSCodex64-1.46.1.exe" -ArgumentList "/VERYSILENT /NORESTART /MERGETASKS=!runcode" -Wait -NoNewWindow
    Write-Host "VS Code Installed"
}

#Declare the functions here
Install-VSCode

#Reboot Sequence
Write-Host "REBOOTING"
& shutdown -r -t 0