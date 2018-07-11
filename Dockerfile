FROM alpine:3.8

RUN apk add --update \
    bash \
    curl \
    git \
    openssh \
    && \
    rm -rf /var/cache/apk/*

ENV K8S_VERSION="1.11.0"

RUN cd /tmp && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/v${K8S_VERSION}/bin/linux/amd64/kubectl && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/ && \
    rm -rf /tmp/*

ENV HELM_VERSION="2.9.1"

RUN curl -L https://kubernetes-helm.storage.googleapis.com/helm-v${HELM_VERSION}-linux-amd64.tar.gz | tar -xvz && \
    mv linux-amd64/helm /usr/local/bin && \
    cd && \
    rm -rf /tmp/* /var/cache/apk/*
