param (
    # The FQDN the Session Hosts have joined
    [Parameter(mandatory = $true)]
    [string]
    $Domain,

    # Resource Group where your WVD resources reside
    [Parameter(mandatory = $true)]
    [string]
    $VMResourceGroupName,

    # Resource Group where your WVD resources reside
    [Parameter(mandatory = $true)]
    [string]
    $HostPoolResourceGroupName,

    # Host Pool to attribute optimization to
    [Parameter(mandatory = $true)]
    [string]
    $HostPoolName
)

function OptimizeVMs {

    # Setting the optimized SKU for the disks (Optimized cost)
    $StorageType = "Standard_LRS"

    # Get the session hosts to optimize
    Write-Host "Getting the WVD Session Hosts"
    $SessionHosts = Get-AzWvdSessionHost -ResourceGroupName $HostPoolResourceGroupName -HostPoolName $HostPoolName

    $vmnames = $SessionHosts.name.trimend(".$domain")
    $vmnames = $vmnames.trimstart("$HostPoolName")
    $vmnames = $vmnames.trimstart([char]0x002F)

    Write-Host "Changing SKU of disks for session hosts"
    foreach ($vmname in $vmnames) {
        Stop-AzVM -Name $vmname -ResourceGroupName $VMResourceGroupName -Force -Verbose
        $disk = Get-AzDisk -ResourceGroupName $VMResourceGroupName -DiskName $vmname*
        $disk.Sku = [Microsoft.Azure.Management.Compute.Models.DiskSku]::new($storageType)
        $disk | Update-AzDisk -Verbose

        Write-Host "Optimization of $vmname DONE"
    }
}

function InitializeVMs {
    $StorageType = "Premium_LRS"

    # Get the session hosts to optimize
    Write-Host "Getting the WVD Session Hosts"
    $SessionHosts = Get-AzWvdSessionHost -ResourceGroupName $HostPoolResourceGroupName -HostPoolName $HostPoolName

    $vmnames = $SessionHosts.name.trimend(".$domain")
    $vmnames = $vmnames.trimstart("$HostPoolName")
    $vmnames = $vmnames.trimstart([char]0x002F)

    foreach ($vmname in $vmnames) {
        Write-Host "Changing $vmname disk SKUs"
        $disk = Get-AzDisk -ResourceGroupName $VMResourceGroupName -DiskName $vmname*
        $disk.Sku = [Microsoft.Azure.Management.Compute.Models.DiskSku]::new($storageType)
        $disk | Update-AzDisk -Verbose

        Write-Host "Starting $vmname"
        Start-AzVM -Name $vmname -ResourceGroupName $VMResourceGroupName -Verbose

        Write-Host "$vmname Started"
    }
}

OptimizeVMs


Start-Sleep -Seconds 30

InitializeVMs