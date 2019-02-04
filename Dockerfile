FROM alpine:3.9

ENV AWSCLI_VERSION=1.16.96

RUN apk --no-cache update && \
    apk --no-cache add python py-pip py-setuptools ca-certificates groff less bash make jq gettext-dev curl wget g++ zip git && \
    pip --no-cache-dir install --upgrade awscli==${AWSCLI_VERSION} && \
    update-ca-certificates && \
    rm -rf /var/cache/apk/*

COPY scripts /opt/scripts
ENV PATH "$PATH:/opt/scripts"

WORKDIR /opt/app