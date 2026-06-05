#!/bin/sh
kubectl get pods --all-namespaces -o json |
jq -r '
  .items[] 
  | 
  select(
    .spec.containers[0].resources.requests.cpu==null
    or
    .spec.containers[0].resources.requests.memory==null
  )
  |
  [
    .metadata.namespace,
    .metadata.ownerReferences[0].kind // "Pod",
    .metadata.ownerReferences[0].name // .metadata.name
  ]
  | @tsv' |
  sort -u |
  column -t
