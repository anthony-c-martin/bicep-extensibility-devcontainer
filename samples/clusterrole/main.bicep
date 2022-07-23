param baseName string

resource aks 'Microsoft.ContainerService/managedClusters@2020-09-01' existing = {
  name: baseName
}

var kubeConfig = aks.listClusterAdminCredential().kubeconfigs[0].value

module kubernetes 'kubernetes.bicep' = {
  name: 'kubernetes-deploy'
  params: {
    kubeConfig: kubeConfig
  }
}
