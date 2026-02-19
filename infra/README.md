# Azure Infrastructure for Zava Storefront

This folder contains Bicep templates and modules for deploying the Zava Storefront web application to Azure.

## Structure
- main.bicep: Root orchestration template
- modules/acr.bicep: Azure Container Registry module
- modules/logAnalytics.bicep: Log Analytics module
- modules/appService.bicep: App Service + Plan module
- main.parameters.json: Deployment parameters

## Deployment
Use Azure Developer CLI (azd) or Azure CLI to deploy.

## Parameters
See main.parameters.json for required values (e.g., image name, location).
