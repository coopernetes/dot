#!/usr/bin/env bash
set -eu
set -o pipefail

[[ "$UID" -eq 0 || "$EUID" -eq 0 ]] && true || (echo "Forgot to run as root!"; echo "sudo $0"; exit 1)

VERSION=${VERSION:-2.15.0}
curl -fsSLO https://github.com/cli/cli/releases/download/v${VERSION}/gh_${VERSION}_linux_amd64.tar.gz
tar -C /tmp -xzf gh_${VERSION}_linux_amd64.tar.gz
cp -R /tmp/gh_${VERSION}_linux_amd64/* /usr/local/
rm -f gh_${VERSION}_linux_amd64.tar.gz
rm -rf /tmp/gh_${VERSION}_linux_amd64/ 

