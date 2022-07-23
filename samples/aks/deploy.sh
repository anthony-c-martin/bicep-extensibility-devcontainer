#!/bin/bash

bicepFile="$(dirname "$0")/main.bicep"
baseName="bicepkubedemo"
adminUsername="anthony"

az deployment sub create \
  -f $bicepFile \
  --location 'West Central US' \
  --name $baseName \
  --parameters \
    baseName=$baseName \
    dnsPrefix=$baseName \
    linuxAdminUsername=$adminUsername \
    sshRSAPublicKey="$(cat ~/.ssh/id_rsa.pub)" \
  --query properties.outputs