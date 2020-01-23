FROM ubuntu:18.04

# install dependencies
RUN apt-get update -yqq && apt-get install curl -yqq

# install doctl
RUN curl -sL https://github.com/digitalocean/doctl/releases/download/v1.37.0/doctl-1.37.0-linux-amd64.tar.gz | tar -xzv && mv doctl /usr/local/bin

# install helm
RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

# install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && chmod +x kubectl && mv kubectl /usr/local/bin

COPY docker-entrypoint.sh /usr/local/bin/
COPY init_k10 /usr/local/bin/
COPY reset_k10 /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]