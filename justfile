set shell := ["cmd.exe", "/c"]

# Standardbefehle anzeigen
default:
    @just --list

# In den Container mit einer Shell einsteigen
shell:
    docker compose exec app /bin/bash

# Container neu starten
restart:
    docker compose restart

# Container stoppen und neu aufbauen
rebuild:
    docker compose down
    docker compose up --build -d

# Container stoppen
down:
    docker compose down

# Container starten
start:
    docker compose up -d

# Logs anzeigen
logs:
    docker compose logs -f

# NPM-Befehle im Container ausführen
npm *args:
    docker compose exec app npm {{args}}

# Container aufräumen (alle Container und nicht verwendete Images entfernen)
clean:
    docker compose down
    docker system prune -f

# Update Abhängigkeiten (minor und patch)
update:
    docker compose exec app npm update

# Update alle Abhängigkeiten (auch major)
update-all:
    docker compose exec app npm install -g npm-check-updates
    docker compose exec app npx ncu -u
    docker compose exec app npm install