# final outcome
FROM gcr.io/distroless/cc-debian12
WORKDIR /app

# Set the working directory
WORKDIR /app

# Copy the application source and Caddy configuration files
COPY src /app/src
COPY Caddyfile /app/Caddyfile
COPY caddy_linux_amd64 /app/caddy

# Ensure the Caddy binary has execute permissions
RUN chmod +x /app/caddy

# Expose the port Caddy will listen on
EXPOSE 8800

# Define the command to run Caddy
CMD ["/app/caddy", "run", "--config", "/app/Caddyfile"]
