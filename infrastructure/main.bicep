@description('Name of the container instance')
param containerName string 





module Container 'azureContainer.bicep' =  {
  name: containerName
  params: {
    
  }
}
