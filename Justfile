restart: down && up

up:
    docker compose up -d --build

down:
    docker compose down

logs:
    docker compose logs -f gateway

check:
    docker compose run --rm --entrypoint "caddy validate --config /etc/caddy/Caddyfile" gateway

db-rollback:
    docker compose run --rm migrations rollback
