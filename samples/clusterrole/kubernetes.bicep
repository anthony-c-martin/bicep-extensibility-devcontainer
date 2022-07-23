@secure()
param kubeConfig string

import kubernetes as k8s {
  kubeConfig: kubeConfig
  namespace: 'shared'
}

resource clusterRole 'rbac.authorization.k8s.io/ClusterRole@v1' = {
  metadata: {
    name: 'cluster-reader'
  }
  rules: []
}

resource crb 'rbac.authorization.k8s.io/ClusterRoleBinding@v1' = {
  roleRef: {
    apiGroup: 'rbac.authorization.k8s.io'
    kind: clusterRole.kind
    name: clusterRole.metadata.name
  }
  metadata: {
    name: 'cluster-reader-rolebinding'
  }
  subjects: []
}
