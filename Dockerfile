# First stage: Build Caddy from source
FROM golang:1.21 AS builder
WORKDIR /app

# Install Caddy
RUN go install github.com/caddyserver/caddy/v2@latest

# Copy your Caddyfile and any Go source files
COPY Caddyfile /app/
COPY src /app/src

# Compile your Caddy server binary
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /app/caddy github.com/caddyserver/caddy/v2

# Second stage: Use the distroless image
FROM gcr.io/distroless/cc-debian12
WORKDIR /app

# Copy files from the builder stage
COPY --from=builder /app /app

# Expose the port Caddy will listen on
EXPOSE 8008

# Set the command to run Caddy
CMD ["/app/caddy", "run", "--config", "/app/Caddyfile"]
