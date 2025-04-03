@description('Location for the resource.')
param location string = resourceGroup().location

@description('name of the Azure container registry')
param acr string = 'acr${uniqueString(resourceGroup().id)}'


resource acrResource 'Microsoft.ContainerRegistry/registries@2024-11-01-preview' = {
  name: acr
  location: location
  sku: {
    name: 'Basic'
  }
  properties: {
    adminUserEnabled: true
  }
}


output loginServer string = acrResource.properties.loginServer
