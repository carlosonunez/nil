#!/usr/bin/env bash
set -euo pipefail
ENV_PASSWORD="${ENV_PASSWORD?Please provide the decryption key for this environment file.}"

trap 'echo nil > .env' ERR

if ! ENV_PASSWORD=${ENV_PASSWORD} scripts/decrypt.sh
then
  >&2 echo "ERROR: Failed to decrypt .env."
  exit 1
fi

docker-compose run --rm aws s3 mb s3://nil.carlosnunez.me
docker-compose run --rm aws s3 website s3://nil.carlosnunez.me \
  --index-document index.html \
  --error-document error.html
docker-compose run --rm aws s3 sync /work/site s3://nil.carlosnunez.me \
  --grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers
echo nil  > .env
