#!/usr/bin/env bash

# https://helm.sh/docs/intro/install/
# https://github.com/helm/helm/releases

[[ "$UID" -ne 0 || "$EUID" -ne 0 ]] && echo "Forgot to run as root!"; echo "sudo $0"; exit 1

