#!/usr/bin/env bash

# https://www.conftest.dev/install/

[[ "$UID" -eq 0 || "$EUID" -eq 0 ]] && true || (echo "Forgot to run as root!"; echo "sudo $0"; exit 1)

