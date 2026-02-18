param prefix string
param location string = 'westus3'
param environment string

var uniqueSuffix = substring(uniqueString(resourceGroup().id), 0, 4)
var appServiceName = toLower('${prefix}-app-${environment}-${uniqueSuffix}')
var insightsName = toLower('${prefix}-insights-${environment}-${uniqueSuffix}')
var acrName = toLower('${prefix}acr${uniqueSuffix}')

module appService './appservice.bicep' = {
  name: 'appService'
  params: {
    appServiceName: appServiceName
    location: location
    insightsName: insightsName
    acrName: acrName
  }
}

module acr './acr.bicep' = {
  name: 'acr'
  params: {
    acrName: acrName
    location: location
  }
}

module insights './insights.bicep' = {
  name: 'insights'
  params: {
    insightsName: insightsName
    location: location
  }
}
