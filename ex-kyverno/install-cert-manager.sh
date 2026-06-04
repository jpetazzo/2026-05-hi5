#!/bin/sh
helm upgrade --install --repo https://charts.jetstack.io \
  --namespace cert-manager --create-namespace \
  cert-manager cert-manager \
  --set crds.enabled=true \
  #
