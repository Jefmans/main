#!/bin/sh

echo "[vault-init] Waiting for Vault to be ready..."

until curl -s http://vault:8200/v1/sys/health | grep -q '"initialized":true'; do
  sleep 1
done

echo "[vault-init] Vault is ready. Writing secrets..."

export VAULT_TOKEN=root
curl --header "X-Vault-Token: $VAULT_TOKEN" \
     --request POST \
     --data '{"data": {"POSTGRES_USER": "myuser", "POSTGRES_PASSWORD": "mysecretpassword"}}' \
     http://vault:8200/v1/secret/data/backend

echo "[vault-init] Secrets written."
