# final outcome
FROM debian:12
WORKDIR /app

COPY src src
COPY Caddyfile ./Caddyfile
COPY caddy ./caddy

EXPOSE 8800

CMD ["/app/caddy", "run"]
