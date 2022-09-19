#!/usr/bin/env bash
set -eu
set -o pipefail

VERSION=${VERSION:-0.15.0}
curl -fsSLo ./kind https://kind.sigs.k8s.io/dl/v${VERSION}/kind-linux-amd64
chmod +x ./kind
mv ./kind $HOME/.local/bin/kind

