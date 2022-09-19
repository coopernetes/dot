#!/usr/bin/env bash

# Necessary for arm64
# https://kubectl.docs.kubernetes.io/installation/kustomize/binaries/
# https://github.com/kubernetes-sigs/kustomize/releases

# Not sure if this is cross-platform
# https://kubectl.docs.kubernetes.io/installation/kustomize/source/
# go install sigs.k8s.io/kustomize/kustomize/v4@latest

[[ "$UID" -eq 0 || "$EUID" -eq 0 ]] && true || (echo "Forgot to run as root!"; echo "sudo $0"; exit 1)

