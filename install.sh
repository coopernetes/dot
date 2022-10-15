#!/bin/bash
VERSION=2.17.0 ./install/linux/gh.sh
sudo bash -c "VERSION=1.19.2 ./install/linux/go.sh"
#minikube: 1.27.0 # or use latest
#kind: 0.15.0
#conftest: 0.34.0
#helm: 3.9.4 
#kustomize: 4.5.7
#kpt: 1.0.0-beta.20
#terraform: 1.2.9
#ansible: 2.13
#exercism: 3.0.13 
