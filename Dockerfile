FROM caddy:latest AS builder

RUN mkdir /srv
WORKDIR /srv

COPY src /srv/src
COPY Caddyfile .
COPY . /srv

EXPOSE 2015

CMD ["caddy", "run", "--envfile", ".env"]
