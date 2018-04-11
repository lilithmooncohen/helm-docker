FROM alpine:3.7

RUN apk add --update curl && \
    rm -rf /var/cache/apk/*

ENV K8S_VERSION="1.10.0"

RUN cd /tmp && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/v${K8S_VERSION}/bin/linux/amd64/kubectl && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/ && \
    rm -rf /tmp/*

ENV HELM_VERSION="2.8.2"

RUN curl -L https://kubernetes-helm.storage.googleapis.com/helm-v${HELM_VERSION}-linux-amd64.tar.gz | tar -xvz && \
    mv linux-amd64/helm /usr/local/bin && \
    cd && \
    rm -rf /tmp/* /var/cache/apk/*
