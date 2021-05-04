| Variable                     | Variable Definition                                                                                        |
|------------------------------|------------------------------------------------------------------------------------------------------------|
| ADOAppId                     | Application ID of the Service Principal used by Azure DevOps                                               |
| domain                       | The domain the session hosts will be joining                                                               |
| HostPoolName                 | The host pool the session hosts will register to                                                           |
| ImageDestRG                  | Where the managed image will be placed (Image also pushed to Shared Image Gallery)                         |
| LocalAdmin                   | The account name to join session hosts to domain (The section before the @ in the UPN)                     |
| Location                     | Azure region being deployed to                                                                             |
| ResourceGroup                | Resource Group for WVD Resources                                                                           |
| ServiceConnection            | Name of the Service Connection in Azure DevOps                                                             |
| SigDefName                   | Shared Image Gallery Image Definition Name (MUST PRE-EXIST IN GALLERY)                                     |
| SIGName                      | Shared Image Gallery (MUST PRE-EXIST)                                                                      |
| SIGRG                        | Shared Image Gallery (MUST PRE-EXIST)                                                                      |
| StorageAccountInstallersPath | UNC Path with double symbols. For example: '\\\\\\\\StorageAccountName.file.core.windows.net\\\installers' |
| SubscriptionId               | Subscription ID for the WVD Deployment                                                                     |
| TenantID                     | Azure Active Directory ID for the WVD Deployment                                                           |
| VMSize                       | The size of the Packer VM                                                                                  |
| VnetRG                       | Resource Group name for the Virtual Network                                                                |
| WVDSubnetName                | Subnet where Session Hosts will reside                                                                     |
| WVDVnetName                  | Virtual network name where Session Hosts will reside                                                       |
| StorageAccountName           | Storage Account where Packer install apps will exist                                                       |
| FSLogixSA                    | Central Azure Files Storage Account name *'**name**.file.core.windows.net'*                                |
| FSLogixSAS                   | Name of the share in the storage account above: *'name.file.core.windows.net\ **sharename**'* 