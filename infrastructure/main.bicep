@description('Name of the container instance')
param containerName string 

@description('The Docker image to deploy')
param image string = 'js9505/mycvimage:latest'




module Container 'azureContainer.bicep' =  {
  name: containerName
  params: {
    image: image
    
  }
}
