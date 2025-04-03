@description('Name of the container instance')
param containerName string = 'mycvcontainer'

@description('Docker image to deploy (from Docker Hub)')
param image string = 'js9505/mycvimage:latest'

@description('Memory for the container in GB')
param memoryGb int = 1

@description('Port the container listens on')
param containerPort int = 3000

@description('CPU cores for the container')
param cpuCores int = 1

module Container 'azureContainer.bicep' =  {
  name: containerName
  params: {
    image: image
    memoryGb: memoryGb
    containerPort: containerPort
    cpuCores: cpuCores
    
  }
}
