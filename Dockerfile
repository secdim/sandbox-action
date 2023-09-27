FROM debian:12-slim

ADD https://github.com/secdim/sandbox-sarif-parser/releases/download/v0.1-beta/sandbox-linux-amd64 .
RUN install sandbox-linux-amd64 /usr/local/bin/sandbox

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
