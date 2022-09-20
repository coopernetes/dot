#!/usr/bin/env bash
set -eu
set -o pipefail

VERSION=${VERSION:-0.15.0}
_dl="https://kind.sigs.k8s.io/dl/v${VERSION}/kind-linux-amd64"
echo "Downloading ${_dl}..."
curl -fsSLo ./kind ${_dl}
chmod +x ./kind
mv ./kind $HOME/.local/bin/kind

