@description('Name of the container instance')
param containerName string = 'mycvcontainer'

@description('The Docker image to deploy')
param image string = 'js9505/mycvimage:latest'

@description('CPU cores for the container')
param cpuCores int = 1

@description('Memory for the container in GB')
param memoryGb int = 1 

@description('Port the container listens on')
param containerPort int = 3000

resource container 'Microsoft.ContainerInstance/containerGroups@2021-07-01' = {
  name: containerName
  location: resourceGroup().location
  properties: {
    containers: [
      {
        name: containerName
        properties: {
          image: image
          resources: {
            requests: {
              cpu: cpuCores
              memoryInGB: memoryGb
            }
          }
          ports: [
            {
              port: containerPort
            }
          ]
        }
      }
    ]
    osType: 'Linux'
    ipAddress: {
      type: 'Public'
      ports: [
        {
          protocol: 'TCP'
          port: containerPort
        }
      ]
    }
  }
}

