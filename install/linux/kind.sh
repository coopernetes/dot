#!/usr/bin/env bash
set -eux
set -o pipefail

[[ "$UID" -eq 0 || "$EUID" -eq 0 ]] && true || (echo "Forgot to run as root!"; echo "sudo $0"; exit 1)

VERSION=${VERSION:-0.15.0}
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v${VERSION}/kind-linux-amd64
chmod +x ./kind
mv ./kind /usr/local/bin/kind

