#!/usr/bin/env bash
set -eu
set -o pipefail

[[ "$UID" -ne 0 || "$EUID" -ne 0 ]] && echo "Forgot to run as root!"; echo "sudo $0"; exit 1

VERSION="${VERSION:-"1.19.1"}"
echo "Cleaning up existing Go install..."
rm -rf /usr/local/go

_dl="https://go.dev/dl/go${VERSION}.linux-amd64.tar.gz"
echo "Downloading ${_dl}"
if [[ -x "$(command -v curl)" ]]; then
  curl -fsSLO ${_dl} 
else
  wget -q ${_dl} 
fi

echo "Installing go to /usr/local..."
tar -C /usr/local -xzf go${VERSION}.linux-amd64.tar.gz

go version

rm -f go${VERSION}.linux-amd64.tar.gz

