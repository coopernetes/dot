#!/usr/bin/env bash

# https://www.conftest.dev/install/

[[ "$UID" -ne 0 || "$EUID" -ne 0 ]] && echo "Forgot to run as root!"; echo "sudo $0"; exit 1

