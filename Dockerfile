# final outcome
FROM debian:12
WORKDIR /app

COPY . ./app

EXPOSE 8800

CMD ["/app/caddy", "run"]
