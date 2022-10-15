#!/usr/bin/env bash
LATEST_VERSION=$(wget -O - "https://api.github.com/repos/open-policy-agent/conftest/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/' | cut -c 2-)
wget "https://github.com/open-policy-agent/conftest/releases/download/v${LATEST_VERSION}/conftest_${LATEST_VERSION}_Linux_x86_64.tar.gz"
tar xzf conftest_${LATEST_VERSION}_Linux_x86_64.tar.gz
mv conftest $HOME/.local/bin
rm -f conftest_${LATEST_VERSION}_Linux_x86_64.tar.gz
