FROM folbricht/routedns:latest

COPY config.toml config.toml
COPY ssl/cloudflare.key cloudflare.key
COPY ssl/cloudflare.crt cloudflare.crt