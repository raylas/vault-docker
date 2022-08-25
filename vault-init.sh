#!/usr/bin/env sh
set -e

vault server -dev -dev-root-token-id=$VAULT_TOKEN &

sleep 5

export VAULT_ADDR=http://localhost:8200
vault secrets enable transit
vault write -f transit/keys/${TRANSIT_KEY_NAME}

wait