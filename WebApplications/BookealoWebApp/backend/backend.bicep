param appName string
param location string = resourceGroup().location
param skuName string = 'B1'

// Replace this with your real frontend URL if known ahead of time
var allowedCorsOrigin = 'https://bookealo-frontend.azurestaticapps.net'

resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: '${appName}-plan'
  location: location
  sku: {
    name: skuName
    capacity: 1
  }
  kind: 'windows'
  properties: {}
}

resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: appName
  location: location
  kind: 'app,windows'
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      netFrameworkVersion: 'v8.0'
      cors: {
        allowedOrigins: [
          allowedCorsOrigin
        ]
      }
      appSettings: [
        {
          name: 'WEBSITE_RUN_FROM_PACKAGE'
          value: '1'
        }
      ]
    }
  }
}

output webAppUrl string = webApp.properties.defaultHostName