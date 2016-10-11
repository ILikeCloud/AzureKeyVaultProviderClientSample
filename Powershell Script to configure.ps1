
Login-AzureRmAccount

$resources = Get-AzureRmResourceProvider -ProviderNamespace Microsoft.Compute
$resources.ResourceTypes.Where{($_.ResourceTypeName -eq 'virtualMachines')}.Locations

#create RG
New-AzureRmResourceGroup -Name KeyVaultRG -Location "West US"

#Create keyvault
New-AzureRmKeyVault -VaultName "mykeyvaultfortesting" -ResourceGroupName "KeyVaultRG" -Location "West US"

#Access to user
Set-AzureRmKeyVaultAccessPolicy -VaultName "mykeyvaultfortesting" -ResourceGroupName "KeyVaultRG" -PermissionsToKeys create,get,wrapKey,unwrapKey,sign,verify  -UserPrincipalName "paalexan@microsoft.com"

#Azure Active Directory Application Client ID
Set-AzureRmKeyVaultAccessPolicy -VaultName "mykeyvaultfortesting" -ResourceGroupName "KeyVaultRG" -ServicePrincipalName "b0b2a0df-b409-43cf-906f-6723ce471527" -PermissionsToKeys get,wrapKey,unwrapKey,sign,verify
