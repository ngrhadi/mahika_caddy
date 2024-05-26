# final outcome
FROM debian:12
WORKDIR /app

COPY . ./app

EXPOSE 8008

CMD ["/app/caddy", "run"]
