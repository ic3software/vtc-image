FROM ubuntu:26.04

ARG VTC_VERSION=0.10.12

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL "https://fpp.ic3.dev/vtc-k8s/${VTC_VERSION}/vtc" -o /usr/local/bin/vtc && \
    chmod 0755 /usr/local/bin/vtc

WORKDIR /app/vtc

COPY entrypoint.sh /entrypoint.sh
RUN chmod 0755 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
