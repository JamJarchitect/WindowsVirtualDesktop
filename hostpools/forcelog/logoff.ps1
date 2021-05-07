# Declare Variables
$HostPool = Read-Host "Input your Host Pool name"
$ResourceGroupName = Read-host "Input the Resource Group Name where the Host Pool resides in"
$WVDUserSessions = Get-AzWvdUserSession -HostPoolName $HostPool -ResourceGroupName $ResourceGroupName
$NumberofWVDSessions = ($WVDUserSessions).count

Write-Host "Logging Off Users"
if ($NumberofWVDSessions -gt "0") {
    try {
        Write-Host "There are $NumberofWVDSessions logged on, they now will be logged off"
        foreach ($WVDUserSession in $WVDUserSessions) {
            
            $InputString = $WVDUserSession.Name
            $WVDUserArray = $InputString.Split("/")
            $WVDUserArray[0]
            $WVDUserArray[1]
            $WVDUserArray[2]
    
            Remove-AzWvdUserSession -HostPoolName $HostPool -ResourceGroupName $ResourceGroupName -SessionHostName $WVDUserArray[1] -Id $WVDUserArray[2]
        }
    }
    catch {
        Write-Host "There 0 users logged on to $HostPool"
    }
}
while ($true) { 
    $NumberofWVDSessions = Get-AzWvdUserSession -HostPoolName $HostPool -ResourceGroupName $ResourceGroupName; $CountNumberofWVDSessions = ($NumberofWVDSessions).count ; if ($CountNumberofWVDSessions -gt "0") { Write-Output "There are still $CountNumberofWVDSessions user(s) on $HostpoolName logged on"; Start-Sleep -s 10 } else { break } 
}