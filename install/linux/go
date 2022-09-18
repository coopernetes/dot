#!/usr/bin/env bash
set -eux
set -o pipefail
VERSION="${VERSION:-"1.19.1"}"

echo "Cleaning up existing Go install..."
if [[ "$UID" -ne 0 || "$EUID" -ne 0 ]]; then 
  sudo rm -rf /usr/local/go
else
  rm -rf /usr/local/go
fi

_dl="https://go.dev/dl/go${VERSION}.linux-amd64.tar.gz"
echo "Downloading ${_dl}"
if [[ -x "$(command -v curl)" ]]; then
  curl -fsSLO ${_dl} 
else
  wget -q ${_dl} 
fi

echo "Installing go to /usr/local..."
if [[ "$UID" -ne 0 || "$EUID" -ne 0 ]]; then 
  sudo tar -C /usr/local -xzf go${VERSION}.linux-amd64.tar.gz
else
  tar -C /usr/local -xzf go${VERSION}.linux-amd64.tar.gz
fi

go version

rm -f go${VERSION}.linux-amd64.tar.gz

