#!/usr/bin/env bash

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
install minikube-linux-amd64 $HOME/.local/bin/minikube
rm -f minikube-linux-amd64 

