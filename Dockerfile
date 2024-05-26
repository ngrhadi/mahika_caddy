# final outcome
FROM debian:12
WORKDIR /app

COPY src src
COPY Caddyfile .
COPY ./caddy_linux_amd64 ./caddy

EXPOSE 8800

CMD ["/app/caddy", "run"]
