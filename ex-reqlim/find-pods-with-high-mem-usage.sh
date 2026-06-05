#!/bin/sh
kubectl get podmetrics -o json --all-namespaces | 
jq '
  .items[]
  |
  [
    .metadata.namespace,
    .metadata.name,
    .containers[0].usage.memory
  ]
  |
  @tsv
  ' -r |
grep -ow [1....Ki]
