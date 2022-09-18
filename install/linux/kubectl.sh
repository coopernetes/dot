#!/usr/bin/env bash
set -e
set -o pipefail

[[ "$UID" -ne 0 || "$EUID" -ne 0 ]] && echo "Forgot to run as root!" > 2; echo "sudo $0"; exit 1

set +u
if [[ -z "$VERSION" ]]; then
  VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt)
fi
set -u

echo "Cleaning up existing Kubectl install..."
rm -rf /usr/local/bin/kubectl

_dl="https://dl.k8s.io/release/${VERSION}/bin/linux/amd64/kubectl"
echo "Downloading ${_dl}"
if [[ -x "$(command -v curl)" ]]; then
  curl -fsSLO ${_dl}
else
  wget -q ${_dl}
fi

echo "Validating kubectl checksum..."
_sha="https://dl.k8s.io/${VERSION}/bin/linux/amd64/kubectl.sha256"
echo "Downloading ${_sha}"
if [[ -x "$(command -v curl)" ]]; then
  curl -fsSLO ${_sha}
else
  wget -q ${_sha}
fi
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check


echo "Installing kubectl to /usr/local..."
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

kubectl version --client

rm -f kubectl
rm -f kubectl.sha256

