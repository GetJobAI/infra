# List all available recipes
default:
    @just --list --unsorted

# Restart the stack
restart: down && up

# Start the stack
up:
    docker compose up -d --build

# Stop the stack
down:
    docker compose down

# Show the gateway logs
logs container="gateway":
    docker compose logs -f {{ container }}

# Check the gateway config
check:
    docker compose run --rm --entrypoint "caddy validate --config /etc/caddy/Caddyfile" gateway

# Rollback the DB
db-rollback:
    docker compose run --rm migrations rollback
