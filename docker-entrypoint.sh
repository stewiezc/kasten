#!/bin/bash

doctl auth init

mkdir ~/.kube

doctl kubernetes cluster kubeconfig show zac-stewart > ~/.kube/config

export KUBECONFIG=~/.kube/config

/bin/bash $1