#!/bin/sh
for NAMESPACE in $(kubectl get ns -o json | jq -r .items[].metadata.name | grep -vw kube-system); do
  kubectl apply --namespace $NAMESPACE -f limitrange.yaml
  kubectl rollout restart deployment --namespace $NAMESPACE
  kubectl rollout restart daemonset --namespace $NAMESPACE
done
