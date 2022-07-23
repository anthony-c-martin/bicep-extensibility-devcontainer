#!/bin/bash

subId=$(az account show --query id 2>/dev/null)
if [ $? -ne 0 ]; then
  az cloud set -n AzureCloud >/dev/null
  az login >/dev/null
  subId=$(az account show --query id 2>/dev/null)
fi

if [ $subId != '"28cbf98f-381d-4425-9ac4-cf342dab9753"' ]; then
  az account set -s "28cbf98f-381d-4425-9ac4-cf342dab9753" >/dev/null
fi