#!/bin/sh
kubectl get pods -o json | jq '.items[] | [.metadata.name, .status.podIP] | @tsv' -r |
while read POD_NAME POD_ADDR; do
  kubectl </dev/tty run ping-$POD_NAME --image alpine --rm -it -- sh -c "
  sleep 1
  if ping -w1 $POD_ADDR >/dev/null; then
    echo ✅️ $POD_NAME
  else
    echo ⛔️ $POD_NAME
  fi
  "
done
