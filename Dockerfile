FROM caddy:latest-builder AS builder

RUN xcaddy build \
  --with github.com/caddyserver/nginx-adapter \
  --with github.com/hairyhenderson/caddy-teapot-module@v0.0.3-0

# Final stage
FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

# WORKDIR /usr/share/caddy

# COPY src /usr/share/caddy
# COPY CaddyFile  /etc/caddy
COPY ./src/ /srv/
COPY ./Caddyfile /etc/caddy/Caddyfile
# EXPOSE 8080
# CMD ["/app/caddy", "run"]

EXPOSE 80
EXPOSE 443
