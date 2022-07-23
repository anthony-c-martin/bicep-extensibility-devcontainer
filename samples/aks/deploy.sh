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
adminUsername="anthony"

az deployment sub create \
  -f "$scriptPath/main.bicep" \
  --location 'West Central US' \
  --name $baseName \
  --parameters \
    baseName=$baseName \
    dnsPrefix=$baseName \
    linuxAdminUsername=$adminUsername \
    sshRSAPublicKey="$(cat ~/.ssh/id_rsa.pub)" \
  --query properties.outputs