param appName string
param location string = resourceGroup().location
param repositoryUrl string
param branch string = 'main'

resource staticWebApp 'Microsoft.Web/staticSites@2022-03-01' = {
  name: appName
  location: location
  sku: {
    name: 'Free'
    tier: 'Free'
  }
  properties: {
    repositoryUrl: repositoryUrl
    branch: branch
    buildProperties: {
      appLocation: '/'
      apiLocation: ''
      appArtifactLocation: 'dist'
    }
  }
}

output staticWebAppDefaultHostname string = staticWebApp.properties.defaultHostname