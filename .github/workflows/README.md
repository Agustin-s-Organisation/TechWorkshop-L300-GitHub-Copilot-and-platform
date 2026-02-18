# Minimal GitHub Actions Workflow for .NET App Deployment

This workflow builds your .NET app, creates a Docker image, pushes it to Azure Container Registry (ACR), and deploys it to Azure App Service for Containers.

## Prerequisites
- Azure resources (ACR and App Service) must already exist (as defined in your infra folder).
- The following GitHub repository secrets must be set:
  - `AZURE_CLIENT_ID`: Azure service principal client ID
  - `AZURE_TENANT_ID`: Azure tenant ID
  - `AZURE_CLIENT_SECRET`: Azure service principal client secret
  - `AZURE_CONTAINER_REGISTRY`: ACR login server (e.g., myregistry.azurecr.io)
  - `AZURE_WEBAPP_NAME`: Name of your App Service
  - `AZURE_RESOURCE_GROUP`: Resource group containing your App Service

## How to Configure Secrets
1. Go to your GitHub repository > Settings > Secrets and variables > Actions.
2. Add each secret above with its corresponding value.

## How to Configure Variables (if needed)
- For static values (like image name or tag), you can use workflow `env:` or define repository variables in the same section as secrets.

---

## Workflow File
Save the following as `.github/workflows/deploy.yml` in your repository.
