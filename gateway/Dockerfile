# Build
FROM caddy:builder-alpine AS builder
RUN xcaddy build \
    --with github.com/ggicci/caddy-jwt

# Run
FROM caddy:alpine
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
