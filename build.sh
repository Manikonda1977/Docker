#!/usr/bin/env bash
set -euo pipefail

export DOCKER_BUILDKIT=1

IMAGE_NAME="node-moo-app:latest"
CACHE_DIR=".docker-cache"

# Ensure cache directory exists
mkdir -p "${CACHE_DIR}"

docker build \
  --file Dockerfile \
  --tag "${IMAGE_NAME}" \
  --build-arg BUILDKIT_INLINE_CACHE=1 \
  --cache-from type=local,src="${CACHE_DIR}" \
  --cache-to type=local,dest="${CACHE_DIR}",mode=max \
  .

echo "✅ Image built: ${IMAGE_NAME}"

