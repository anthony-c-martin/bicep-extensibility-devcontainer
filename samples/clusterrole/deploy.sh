#!/bin/bash

bicepFile="$(dirname "$0")/main.bicep"
baseName="bicepkubedemo"

az deployment group create \
  -f $bicepFile \
  --resource-group $baseName \
  --name $baseName \
  --parameters \
    baseName=$baseName \
  --query properties.outputs