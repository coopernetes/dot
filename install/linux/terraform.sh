#!/usr/bin/env bash
set -x
set -eu
set -o pipefail

# [[ "$UID" -eq 0 || "$EUID" -eq 0 ]] && true || (echo "Forgot to run as root!"; echo "sudo $0"; exit 1)

VERSION=${VERSION:-1.2.9}

_dl="https://releases.hashicorp.com/terraform/${VERSION}/terraform_${VERSION}_linux_amd64.zip"
echo "Downloading ${_dl}..."
curl -fsSLO ${_dl}
unzip terraform_*_linux_amd64.zip
mv terraform $HOME/.local/bin/terraform
rm -f terraform_*_linux_amd64.zip

