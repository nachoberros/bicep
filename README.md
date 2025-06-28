# Azure Infrastructure Deployment with Bicep

This repository contains Bicep templates to deploy the infrastructure for our application, including:

- **Frontend**: Angular app deployed as an Azure Static Web App  
- **Backend**: API hosted as an Azure App Service

# Usage examples:

```bash
# Login to Azure
az login --tenant bdfdbcae-49aa-4e3e-ac4f-9dded6d5e510

# Create resource group
az group create --name bookealo-rg --location westeurope
az group create --name loggealo-rg --location westeurope

# Deploy frontend Bookealo (Angular Static Web App)
cd repos\bicep\WebApplications\BookealoWebApp\

az deployment group what-if --resource-group bookealo-rg --template-file frontend.bicep --parameters @frontend.parameters.dev.json
az deployment group create --resource-group bookealo-rg --template-file frontend.bicep --parameters @frontend.parameters.dev.json

# Deploy backend Bookealo (.NET API on App Service)
cd ../backend

az deployment group what-if --resource-group bookealo-rg --template-file backend.bicep --parameters @parameters.dev.json
az deployment group create --resource-group bookealo-rg --template-file backend.bicep --parameters @parameters.dev.json

# Check outputs

az staticwebapp show --name bookealo-frontend --resource-group bookealo-rg --query defaultHostname
az webapp show --name bookealo-backend --resource-group bookealo-rg --query defaultHostName


# Deploy frontend Loggealo (React Static Web App)
cd repos\bicep\WebApplications\LoggealoApp\

az deployment group what-if --resource-group loggealo-rg --template-file frontend.bicep --parameters @frontend.parameters.dev.json
az deployment group create --resource-group loggealo-rg --template-file frontend.bicep --parameters @frontend.parameters.dev.json

# Deploy backend Loggealo (.NET API on App Service)
cd ../backend

az deployment group what-if --resource-group loggealo-rg --template-file backend.bicep --parameters @parameters.dev.json
az deployment group create --resource-group loggealo-rg --template-file backend.bicep --parameters @parameters.dev.json