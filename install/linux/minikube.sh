#!/usr/bin/env bash

_dl="https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64"
echo "Downloading ${_dl}..."
curl -fsSLO ${_dl}
install minikube-linux-amd64 $HOME/.local/bin/minikube
rm -f minikube-linux-amd64 

