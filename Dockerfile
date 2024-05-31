# Second stage: Use the distroless image
FROM gcr.io/distroless/cc-debian12
WORKDIR /app

# Copy files from the builder stage
COPY CaddyFile /etc/caddy/CaddyFile
COPY caddy /etc/caddy/caddy
COPY ./app/src /srv

# Expose the port Caddy will listen on
EXPOSE 8008

# Set the command to run Caddy
# CMD ["/app/caddy", "run", "--config", "/app/Caddyfile"]
CMD ["/app/caddy", "run", "--envfile" ".env"]
