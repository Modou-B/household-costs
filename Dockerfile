FROM node:20-slim

WORKDIR /app

# Benötigte Pakete für Electron installieren
RUN apt-get update && apt-get install -y \
    curl \
    libgtk-3-0 \
    libnss3 \
    libxtst6 \
    libxss1 \
    libasound2 \
    libgbm1 \
    && curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to /usr/local/bin \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Initialisierungsskript
COPY docker-init.sh /docker-init.sh
RUN chmod +x /docker-init.sh

CMD ["/docker-init.sh"]