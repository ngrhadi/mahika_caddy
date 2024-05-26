FROM caddy:2.8.0-rc.1-builder-alpine AS builder

RUN xcaddy build \
  --with github.com/hairyhenderson/caddy-teapot-module@v0.0.3-0

# Final stage
FROM caddy:2.8.0-rc.1-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

# WORKDIR /usr/share/caddy

# COPY src /usr/share/caddy
# COPY CaddyFile  /etc/caddy
COPY ./src/ /srv/
COPY ./CaddyFile /etc/caddy/CaddyFile
# EXPOSE 8080
# CMD ["/app/caddy", "run"]

EXPOSE 80
EXPOSE 443
