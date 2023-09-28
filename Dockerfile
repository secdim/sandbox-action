FROM debian:12-slim

ADD https://github.com/secdim/sandbox-sarif-parser/releases/download/v0.1.2-beta/sandbox-linux-amd64 .
RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates \
    && install sandbox-linux-amd64 /usr/local/bin/sandbox \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
