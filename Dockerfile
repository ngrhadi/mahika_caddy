# final outcome
FROM debian:12

WORKDIR /app

COPY . /app

EXPOSE 80

CMD ["/app/caddy", "run"]
