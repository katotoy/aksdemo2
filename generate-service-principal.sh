#!/bin/bash
# This script requires Azure CLI version 2.25.0 or later. Check version with `az --version`.

# Modify for your environment.
# ACR_NAME: The name of your Azure Container Registry
# SERVICE_PRINCIPAL_NAME: Must be unique within your AD tenant
ACR_NAME=aksdemoacr1
SERVICE_PRINCIPAL_NAME=acr-sp-demo

# Obtain the full registry ID for subsequent command args
ACR_REGISTRY_ID=$(az acr show --name aksdemoacr1 --query id --output tsv)

# Create the service principal with rights scoped to the registry.
# Default permissions are for docker pull access. Modify the '--role'
# argument value as desired:
# acrpull:     pull only
# acrpush:     push and pull
# owner:       push, pull, and assign roles
HWh3t85uIWZY~DZSuy5d_~aEcpDneqqy1X

SP_PASSWD=$(az ad sp create-for-rbac --name acr-sp-demo --scopes /subscriptions/55fdbd2d-1c60-45e3-a049-18c1fe63c022/resourceGroups/aksdemo1-rg/providers/Microsoft.ContainerRegistry/registries/aksdemoacr1 --role acrpull --query password --output tsv)
SP_APP_ID=$(az ad sp list --display-name acr-sp-demo --query [].appId --output tsv)
1bc45972-8c0c-4339-b7ab-260d14aef90a


# Output the service principal's credentials; use these in your services and
# applications to authenticate to the container registry.
echo "Service principal ID: $SP_APP_ID"
echo "Service principal password: $SP_PASSWD"