#!/usr/bin/env bash

# https://kpt.dev/installation/kpt-cli
# https://github.com/GoogleContainerTools/kpt/releases/download/v1.0.0-beta.20/kpt_linux_amd64

[[ "$UID" -eq 0 || "$EUID" -eq 0 ]] && true || (echo "Forgot to run as root!"; echo "sudo $0"; exit 1)

