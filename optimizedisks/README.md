# Disk optimization when deallocated
When deallocating your non-persistent session hosts with premium SSDs, you're paying for cheap storage of the VM itself but still charged for the managed disks at premium SKU. This script automates the change of SKU of all the disks (OS and data) associated with your session hosts on the host pool specified after deallocation.

If this script is just run with the parameters, it will optimize then re-initialize. Use this as a foundation of building out your scaling automation if the documented version does not fit the bill.

# Prerequisites
- Have the parameter values to hand
  - Domain
    - *FQDN of the domain the session hosts have joined*
  - VMResourceGroup
    - *Resource Group where your session hosts reside in*
  - HostPoolResourceGroup
    - *Resource Group where your host pool resides in*
  - HostPoolName
    - *Name of the host pool where your session hosts are associated to*