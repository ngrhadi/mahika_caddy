FROM caddy:latest-builder AS builder

WORKDIR /usr/share/caddy

COPY src /usr/share/caddy
COPY CaddyFile  /etc/caddy/CaddyFile

RUN xcaddy build \
  --with github.com/caddyserver/nginx-adapter \
  --with github.com/hairyhenderson/caddy-teapot-module@v0.0.3-0

FROM caddy:latest


COPY --from=builder /usr/bin/caddy /usr/bin/caddy
