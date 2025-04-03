@description('Location for the resources.')
param location string = resourceGroup().location

@description('Location for the resource group.')
param resourceGroupLocation string = location  

@description('Name of the container instance')
param containerName string 

param rgDeploy bool = false

param containerDeploy bool  = false

module resourcegroup 'resourceGroup.bicep' = if (rgDeploy) {
  scope: subscription()
  params: {
    resourceGroupLocation: resourceGroupLocation
  }
}

module Container 'azureContainer.bicep' = if (containerDeploy) {
  name: containerName
  params: {
    
  }
}
