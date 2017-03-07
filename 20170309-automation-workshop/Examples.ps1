Install-Module AzureRM
Install-Module Azure

# Login

Add-AzureRmAccount -SubscriptionName "Personal MSDN Visual Studio Enterprise – MPN"
Add-AzureRmAccount -SubscriptionId "c8de5b2d-635d-4745-9813-69dd09db573d"

Get-AzureRmSubscription -SubscriptionId "c8de5b2d-635d-4745-9813-69dd09db573d" | Select-AzureRmSubscription

Get-AzureRmSubscription
Get-AzureRMResourceGroup






Get-AzureRMResourceProvider
Get-AzureRmResourceProvider | Get-Member






((Get-AzureRmResourceProvider -ProviderNamespace Microsoft.Devices).ResourceTypes | Where-Object { $_.ResourceTypeName -eq 'IOTHubs'}).Locations

((Get-AzureRmResourceProvider -ProviderNamespace Microsoft.Devices).ResourceTypes | Where-Object { $_.ResourceTypeName -eq 'IOTHubs'}).ApiVersions


## Global
$Customer = 'cust01'
$resourcegroup = "$Customer-iot-rsg"
$location = 'West Europe'

$iothubname = "$Customer-iot-iothub"

New-AzureRmResourceGroup -Name $resourcegroup -Location $location  -Tag @{ Ledger="1500"; Environment="Test" }
New-AzureRmIotHub -Name $iothubname -ResourceGroupName $resourcegroup -SkuName S1 -Units 1 -Location 'West Europe'

$key = (Get-AzureRmIotHubKey -ResourceGroupName $resourcegroup -Name $iothubname -KeyName "iothubowner").PrimaryKey 
$connstring = (Get-AzureRmIotHubConnectionString -ResourceGroupName $resourcegroup -Name $iothubname -KeyName "iothubowner").PrimaryConnectionString




### Create the Linux Machine

## Other Global vars

$storageaccountname = $Customer + 'iotstorage0001'
$StorageType = "Standard_LRS"


## Network
$InterfaceName = "$Customer-node01-nic01"
$SubnetName = "servers"
$VNetName = "$Customer-iot-vnet"
$VNetAddressPrefix = "10.5.0.0/16"
$VNetSubnetAddressPrefix = "10.5.1.0/24"

## Compute
$VMName = "$Customer-iot-node01"
$VMSize = "Standard_A1"
$OSDiskName = $VMName + "OSDisk"


## User
$user = "$Customer-admin"
$password = 'Pasword123!'
$securePassword = ConvertTo-SecureString $password -AsPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential ($user, $securePassword) 


# Resource Group
# New-AzureRmResourceGroup -Name $ResourceGroup -Location $Location

# Storage
$StorageAccount = New-AzureRmStorageAccount -ResourceGroupName $ResourceGroup -Name $StorageAccountName.ToLower() -Type $StorageType -Location $Location

# Network
$PIp = New-AzureRmPublicIpAddress -Name $InterfaceName -ResourceGroupName $ResourceGroup -Location $Location -AllocationMethod Dynamic
$SubnetConfig = New-AzureRmVirtualNetworkSubnetConfig -Name $SubnetName -AddressPrefix $VNetSubnetAddressPrefix
$VNet = New-AzureRmVirtualNetwork -Name $VNetName -ResourceGroupName $ResourceGroup -Location $Location -AddressPrefix $VNetAddressPrefix -Subnet $SubnetConfig
$Interface = New-AzureRmNetworkInterface -Name $InterfaceName -ResourceGroupName $ResourceGroup -Location $Location -SubnetId $VNet.Subnets[0].Id -PublicIpAddressId $PIp.Id

# Compute

## Setup local VM object
$VirtualMachine = New-AzureRmVMConfig -VMName $VMName -VMSize $VMSize
$VirtualMachine = Set-AzureRmVMOperatingSystem -VM $VirtualMachine -ComputerName $VMName -Linux -Credential $Credential
$VirtualMachine = Set-AzureRmVMSourceImage -VM $VirtualMachine -PublisherName "Canonical" -Offer "UbuntuServer" -Skus "16.04.0-LTS" -Version "latest"
$VirtualMachine = Add-AzureRmVMNetworkInterface -VM $VirtualMachine -Id $Interface.Id
$OSDiskUri = $StorageAccount.PrimaryEndpoints.Blob.ToString() + "vhds/" + $OSDiskName + ".vhd"
$VirtualMachine = Set-AzureRmVMOSDisk -VM $VirtualMachine -Name $OSDiskName -VhdUri $OSDiskUri -CreateOption FromImage

## Create the VM in Azure
New-AzureRmVM -ResourceGroupName $ResourceGroup -Location $Location -VM $VirtualMachine



# SSH access rule
$nsgName = $Customer + 'nsg'
$SSHRule = New-AzureRmNetworkSecurityRuleConfig -Name $nsgName -Description "Allow SSH" `
    -Access Allow -Protocol Tcp -Direction Inbound -Priority 110 `
    -SourceAddressPrefix Internet -SourcePortRange * `
    -DestinationAddressPrefix * -DestinationPortRange 22

$nsg = New-AzureRmNetworkSecurityGroup -ResourceGroupName $resourcegroup -Location $location `
    -Name $nsgName -SecurityRules $SSHRule
    
$nsgnew = Get-AzureRmNetworkSecurityGroup -Name $nsgName -ResourceGroupName $resourcegroup
$nsgcurrent = $nsgnew[0]

$nicsnew = Get-AzureRmNetworkInterface -ResourceGroupName $resourcegroup

Foreach ($n in $nicsnew) {
  
  $n.NetworkSecurityGroup = $nsgcurrent
  Set-AzureRmNetworkInterface -NetworkInterface $n

}



Get-AzureRmAutomationRunbook -AutomationAccountName lab-iot-auto -ResourceGroupName lab-iot-rsg | Select Name


$params = @{"VMName" = "cust01-iot-node01";"ResourceGroupName"="cust01-iot-rsg"}
Start-AzureRmAutomationRunbook -Name lab-iot-powershell -AutomationAccountName lab-iot-auto -Parameters $params