# # First stage: Use a build image with a shell
# FROM debian:stable-slim as builder
# WORKDIR /app

# # Copy files to the builder stage
# COPY src /app/src
# COPY Caddyfile /app/Caddyfile
# COPY caddy /app/caddy

# # Ensure the Caddy binary has execute permissions
# RUN chmod +x /app/caddy

# Second stage: Use the distroless image
FROM gcr.io/distroless/cc-debian12
WORKDIR /app

# Copy files from the builder stage
COPY Caddyfile /etc/caddy/Caddyfile
COPY . .

# Expose the port Caddy will listen on
EXPOSE 8008

# Set the command to run Caddy
# CMD ["/app/caddy", "run", "--config", "/app/Caddyfile"]
CMD ["/app/caddy", "run", "--envfile" ".env"]
