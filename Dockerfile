FROM golang:1.21-alpine

LABEL vendor="SecDim" \
    copyright="Security Dimension Pty Ltd. All rights reserved" \
    description="SecDim Sandbox Sarrif Parser" \
    version="1.0.0"

WORKDIR /app
RUN git clone https://github.com/secdim/sandbox-action.git
COPY . .
RUN go build -o sandbox

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]