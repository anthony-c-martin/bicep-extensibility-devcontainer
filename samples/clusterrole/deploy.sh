#!/bin/bash

scriptPath=$(dirname "$0")
subId=$(az account show --query id 2>/dev/null)
if [ $? -ne 0 ]; then
  az cloud set -n AzureCloud
  az login
  subId=$(az account show --query id 2>/dev/null)
fi

if [ $subId != '"28cbf98f-381d-4425-9ac4-cf342dab9753"' ]; then
  az account set -s "28cbf98f-381d-4425-9ac4-cf342dab9753"
fi

baseName="bicepkubedemo"

az deployment group create \
  -f "$scriptPath/main.bicep" \
  --resource-group $baseName \
  --name $baseName \
  --parameters \
    baseName=$baseName \
  --query properties.outputs