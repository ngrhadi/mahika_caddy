# First stage: Use a build image with a shell
FROM debian:stable-slim as builder
WORKDIR /app

# Copy files to the builder stage
COPY src src
COPY Caddyfile .
COPY ./caddy_linux_amd64 ./caddy

# Ensure the Caddy binary has execute permissions
RUN chmod +x /app/caddy

# Second stage: Use the distroless image
FROM gcr.io/distroless/cc-debian12
WORKDIR /app

# Copy files from the builder stage
COPY --from=builder /app /app

# Expose the port Caddy will listen on
EXPOSE 8008

# Set the command to run Caddy
CMD ["/app/caddy", "run"]
