param location string = resourceGroup().location
param environmentName string
param storageAccountName string
param keyVaultName string

resource containerAppsEnv 'Microsoft.App/containerAppsEnvironments@2022-03-01' = {
  name: environmentName
  location: location
  properties: {}
}

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

resource keyVault 'Microsoft.KeyVault/vaults@2022-07-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
    sku: {
      name: 'standard'
      family: 'A'
    }
    accessPolicies: []
    enabledForDeployment: true
    enabledForTemplateDeployment: true
  }
}
