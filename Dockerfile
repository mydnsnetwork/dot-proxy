FROM folbricht/routedns:latest

# Services Definition
COPY services/adblock.toml adblock.toml
COPY services/family.toml family.toml
COPY services/freedom.toml freedom.toml
COPY services/paranoia.toml paranoia.toml

# Cloudflare Origin CA Keys
COPY ssl/cloudflare.crt cloudflare.crt
COPY ssl/cloudflare.key cloudflare.key