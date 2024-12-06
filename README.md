# Template Repository (Infrastructure & Pipeline-Only)

This repository serves as a template for new applications. It provides:

- **Infrastructure as Code (IaC):** Bicep templates for Azure Container Apps environment, Storage Account, Key Vault, etc.
- **GitHub Actions CI/CD Workflows:**
  - `infrastructure-deploy.yml`: Deploys the Azure resources.
  - `build-and-push.yml`: Builds and pushes your container image to Azure Container Registry (ACR).
  - `app-deploy.yml`: Deploys/updates your Azure Container App with the new image.

## How to Use

1. **Create a new repository from this template.**
2. **Add your application code:**
   - Put your source code in the repository (e.g., a `src` folder).
   - Update the `Dockerfile` to build and run your application.
   - Adjust `build-and-push.yml` steps to build/test your code before containerizing.
   
3. **Set up repository secrets:**
   - `AZURE_CLIENT_ID`, `AZURE_TENANT_ID`, `AZURE_SUBSCRIPTION_ID` for Azure login.
   - `REGISTRY_NAME`, `RESOURCE_GROUP`, `ENV_NAME`, `STORAGE_ACCOUNT_NAME`, `KEYVAULT_NAME`, `APP_NAME` can be set as repository secrets or in workflow env variables.

4. **Run the infrastructure deploy workflow:**
   - Trigger it manually via the `Actions` tab or push changes to `main`.
   - Once the infrastructure is deployed, your ACR, Container Apps Environment, Storage Account, and Key Vault will be ready.

5. **Push your application code to `main`:**
   - The `build-and-push.yml` workflow will build your application’s container image and push it to ACR.

6. **Trigger the `app-deploy.yml` workflow:**
   - This updates the Container App to use the newly pushed image.

**This template does not include any default application code.**  
It’s designed so your development team can bring their own application stack and integrate it into the provided CI/CD pipeline and infrastructure scaffolding.
