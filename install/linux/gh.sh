#!/usr/bin/env bash
set -eu
set -o pipefail

VERSION=${VERSION:-2.15.0}
_dl="https://github.com/cli/cli/releases/download/v${VERSION}/gh_${VERSION}_linux_amd64.tar.gz"
echo "Downloading ${_dl}"
curl -fsSLO ${_dl}
tar -C /tmp -xzf gh_${VERSION}_linux_amd64.tar.gz
cp -R /tmp/gh_${VERSION}_linux_amd64/* $HOME/.local/
rm -f gh_${VERSION}_linux_amd64.tar.gz
rm -rf /tmp/gh_${VERSION}_linux_amd64/ 

