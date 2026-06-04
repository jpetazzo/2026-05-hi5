#!/bin/sh
helm upgrade --install --repo https://traefik.github.io/charts \
  --namespace traefik --create-namespace \
  traefik traefik \
  #
