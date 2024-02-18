# Build folbricht/routedns
FROM golang:alpine as builder
ARG GOOS
ARG GOARCH

RUN apk add git && git clone https://github.com/folbricht/routedns.git /build
WORKDIR /build/cmd/routedns
RUN GOOS=$GOOS GOARCH=$GOARCH CGO_ENABLED=0 go build 

# Run
FROM alpine:latest

# Binary
COPY --from=builder /build/cmd/routedns/routedns .

# Services Definition
COPY services/adblock.toml adblock.toml
COPY services/family.toml family.toml
COPY services/freedom.toml freedom.toml
COPY services/paranoia.toml paranoia.toml

# Cloudflare Origin CA Keys
COPY ssl/cloudflare.crt cloudflare.crt
COPY ssl/cloudflare.key cloudflare.key

EXPOSE 53/tcp 53/udp
ENTRYPOINT ["/routedns"]
CMD ["config.toml"]