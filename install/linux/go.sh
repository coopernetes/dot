#!/usr/bin/env bash
set -eu
set -o pipefail

[[ "$UID" -eq 0 || "$EUID" -eq 0 ]] && true || (echo "Forgot to run as root!"; echo "sudo $0"; exit 1)

VERSION="${VERSION:-"1.19.1"}"
echo "Cleaning up existing Go install..."
rm -rf /usr/local/go

_dl="https://go.dev/dl/go${VERSION}.linux-amd64.tar.gz"
echo "Downloading ${_dl}"
curl -fsSLO ${_dl}

echo "Installing go to /usr/local..."
tar -C /usr/local -xzf go${VERSION}.linux-amd64.tar.gz

/usr/local/go/bin/go version

rm -f go${VERSION}.linux-amd64.tar.gz

