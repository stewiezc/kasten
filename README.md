# kasten
kasten temp

## Build

`docker build -t init-k10:local .`

## Digital Ocean setup

`export DIGITALOCEAN_ACCESS_TOKEN=<your token>`

## Run init

`docker run -e DIGITALOCEAN_ACCESS_TOKEN=$DIGITALOCEAN_ACCESS_TOKEN init-k10:local init_k10`

## Get shell

`docker run -it --rm --entrypoint /bin/bash -e DIGITALOCEAN_ACCESS_TOKEN=$DIGITALOCEAN_ACCESS_TOKEN init-k10:local`

then run `docker-entrypoint.sh`

## Run reset

deleting namespaces caused the api-resources to throw errors (kubectl api-resources)

fixed with `kubectl delete apiservice v1alpha1.actions.kio.kasten.io`

`docker run -e DIGITALOCEAN_ACCESS_TOKEN=$DIGITALOCEAN_ACCESS_TOKEN init-k10:local reset_k10`