#!/usr/bin/env bash
set -euo pipefail
ENV_PASSWORD="${ENV_PASSWORD?Please provide the decryption key for this environment file.}"

docker-compose run --rm gpg \
  --batch \
  --yes \
  --passphrase "${ENV_PASSWORD}" \
  --output .env  \
  --encrypt \
  .env.gpg
