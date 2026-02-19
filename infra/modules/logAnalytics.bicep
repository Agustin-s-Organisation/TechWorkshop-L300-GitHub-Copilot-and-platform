param logAnalyticsName string
param location string

resource workspace 'Microsoft.OperationalInsights/workspaces@2021-06-01' = {
  name: logAnalyticsName
  location: location
  sku: {
    name: 'PerGB2018'
  }
}
output workspaceId string = workspace.id
