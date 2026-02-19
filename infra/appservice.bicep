param appServiceName string
param location string
param insightsName string
param acrName string

resource appServicePlan 'Microsoft.Web/serverfarms@2021-02-01' = {
  name: '${appServiceName}-plan'
  location: location
  sku: {
    name: 'S1'
    tier: 'Standard'
    capacity: 1
  }
}

resource appService 'Microsoft.Web/sites@2021-02-01' = {
  name: appServiceName
  location: location
  kind: 'linux'
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      appSettings: [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: 'InstrumentationKey=${insightsName}'
        }
      ]
      linuxFxVersion: 'DOCKER|${acrName}.azurecr.io/zava-storefront:latest'
    }
  }
  identity: {
    type: 'SystemAssigned'
  }
}
