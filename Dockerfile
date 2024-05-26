FROM caddy:latest

WORKDIR /usr/share/caddy

COPY src /usr/share/caddy
COPY CaddyFile  /etc/caddy/CaddyFile

CMD ["caddy", "run"]
