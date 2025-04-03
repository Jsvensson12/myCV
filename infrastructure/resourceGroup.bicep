targetScope = 'subscription'

param resourceGroupName string = 'cv-resource-group'
param resourceGroupLocation string

resource rg 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: resourceGroupName
  location: resourceGroupLocation
  properties: {
  
  }
}
