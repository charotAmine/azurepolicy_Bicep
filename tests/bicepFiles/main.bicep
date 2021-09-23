// =========== main.bicep ===========
targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: 'rg-test'
  location: 'westeurope'
}

module stg './storage.bicep' = {
  name: 'storageDeployment'
  scope: rg   
  params: {
    stName: '001stgdeploymenttest'
  }
}
