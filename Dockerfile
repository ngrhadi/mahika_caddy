FROM darron/caddy

RUN mkdir /srv

WORKDIR /srv

COPY . /srv

EXPOSE 8800

CMD ["caddy", "run", "--envfile", ".env"]
