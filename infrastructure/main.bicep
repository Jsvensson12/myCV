@description('Location for the resources.')
param location string = resourceGroup().location

@description('Location for the resource group.')
param resourceGroupLocation string = location  

param rgDeploy bool = false

param acrDeploy bool  = false

module resourcegroup 'resourceGroup.bicep' = if (rgDeploy) {
  scope: subscription()
  params: {
    resourceGroupLocation: resourceGroupLocation
  }
}

module acrModule './azureContainerRegistry.bicep' = if (acrDeploy) {
  name: 'acrDeployment'
  params: {
    location: location
    acr: 'acr${uniqueString(resourceGroup().id)}'
  }
}
