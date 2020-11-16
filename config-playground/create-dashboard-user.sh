#!/bin/sh

export KUBECONFIG=config-playground

kubectl apply -f dashboard-ServiceAccount.yaml
kubectl apply -f dashboard-ClusterRoleBinding.yaml

kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')
