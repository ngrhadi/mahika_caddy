FROM caddy:latest

# WORKDIR /usr/share/caddy

# COPY src /usr/share/caddy
# COPY CaddyFile  /etc/caddy
COPY ./src/ /srv/
COPY ./Caddyfile /etc/caddy/Caddyfile
# EXPOSE 8080
# CMD ["/app/caddy", "run"]
