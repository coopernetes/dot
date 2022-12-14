#!/usr/bin/env bash
set -eu
set -o pipefail

VERSION=${VERSION:-2.13}

[[ -z "$(command -v python3)" ]] && echo "Requires Python 3 to be installed." && exit 1
! [[ "$(python3 -V)" =~ Python[[:space:]]3.([89]|10) ]] && echo "Requires Python 3.8 or later." && exit 1 
[[ -z "$(python3 -m pip -V 2> /dev/null)" ]] && echo "Requires pip to be installed." && exit 1

echo "Installing Ansible ${VERSION}..."
python3 -m pip install --user ansible-core==${VERSION}

