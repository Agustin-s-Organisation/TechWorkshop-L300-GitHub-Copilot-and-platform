param appServiceName string
param location string
param imageName string
param acrName string
param logAnalyticsId string

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
      linuxFxVersion: 'DOCKER|${acrName}.azurecr.io/${imageName}'
      appSettings: [
        {
          name: 'LOG_ANALYTICS_WORKSPACE_ID'
          value: logAnalyticsId
        }
      ]
    }
  }
  identity: {
    type: 'SystemAssigned'
  }
}
