@description('Name of the container instance')
param containerName string 

@description('Docker image to deploy (from Docker Hub)')
param image string

@description('Memory for the container in GB')
param memoryGb int 

@description('Port the container listens on')
param containerPort int

@description('CPU cores for the container')
param cpuCores int

module Container 'azureContainer.bicep' =  {
  name: containerName
  params: {
    image: image
    memoryGb: memoryGb
    containerPort: containerPort
    cpuCores: cpuCores
    
  }
}
