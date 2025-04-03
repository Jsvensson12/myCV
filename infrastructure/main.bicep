@description('Name of the container instance')
param containerName string 

param containerDeploy bool  = false



module Container 'azureContainer.bicep' = if (containerDeploy) {
  name: containerName
  params: {
    
  }
}
