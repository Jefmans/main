#!/bin/sh

echo "[vault-init] Waiting for Vault to be ready..."
# apt-get update && apt-get install -y curl


until curl -s http://vault:8200/v1/sys/health | grep -q '"initialized":true'; do
  sleep 1
done

echo "[vault-init] Vault is ready. Writing secrets..."

vault login root

vault kv put secret/backend POSTGRES_USER=myuser POSTGRES_PASSWORD=mysecretpassword

echo "[vault-init] Secrets written."
