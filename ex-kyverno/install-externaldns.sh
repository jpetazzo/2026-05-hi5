#!/bin/sh
helm upgrade --install --repo https://kubernetes-sigs.github.io/external-dns/ \
  --namespace external-dns --create-namespace \
  external-dns external-dns \
  --values values-external-dns.yaml \
  #
