Function Add-MyServicePrinicipal {

  param(
        
    [string]$DisplayName,
    [string]$Domain,
    [string]$Password,
    [string]$SubscriptionId,
    [string]$TenantId
  )

 
  # 
  Add-AzureRmAccount -SubscriptionId $SubscriptionId
   
    
  if(Get-AzureRmADApplication | ? {$_.DisplayName -eq $DisplayName}){
    $app = Get-AzureRmADApplication | ? {$_.DisplayName -eq $DisplayName}
    Remove-AzureRmADApplication -ObjectId $app.ObjectId.Guid -Force
  }
  if(Get-AzureRmADServicePrincipal -SearchString $DisplayName){
    $appsp = Get-AzureRmADServicePrincipal -SearchString $DisplayName
    Remove-AzureRmADServicePrincipal -ObjectId $appsp.Id
  }
  
  $vars = @{
    DisplayName = $DisplayName
    Homepage = "https://$Domain/$DisplayName"
    IdentifierUris = "https://$Domain/$DisplayName" 
    Password = $Password 
  }  
 
  $app = New-AzureRmADApplication @vars 
 
  New-AzureRmADServicePrincipal -ApplicationId $app.ApplicationId.Guid
  Start-Sleep -Seconds 10 # Until it really creates it
  New-AzureRmRoleAssignment -RoleDefinitionName 'Contributor' -ServicePrincipalName $app.ApplicationId.Guid

}

Add-MyServicePrinicipal  -DisplayName 'iotapp2' -Domain 'example.com' -Password 'Password12!' -SubscriptionId 'c8de5b2d-635d-4745-9813-69dd09db573d' -TenantId  '63060cb1-0960-4615-8769-b110040fa763'
