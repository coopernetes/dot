#!/usr/bin/env bash
set -ex
set -o pipefail

set +u
if [[ -z "$VERSION" ]]; then
  VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt)
else
  # This is only here because I want to always take in a pure semver
  # and not v0.x.y for some & 0.a.b for others.
  VERSION="v${VERSION}"
fi
set -u

# VERSION=${VERSION:-$(curl -L -s https://dl.k8s.io/release/stable.txt)}

_dl="https://dl.k8s.io/release/${VERSION}/bin/linux/amd64/kubectl"
echo "Downloading ${_dl}"
curl -fsSLO ${_dl}

echo "Validating kubectl checksum..."
_sha="https://dl.k8s.io/${VERSION}/bin/linux/amd64/kubectl.sha256"
echo "Downloading ${_sha}"
curl -fsSLO ${_sha}
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

echo "Installing kubectl to $HOME/.local/bin ..."
install -o $(id -u) -g $(id -g) -m 0755 kubectl $HOME/.local/bin/kubectl

kubectl version --client

rm -f kubectl
rm -f kubectl.sha256

