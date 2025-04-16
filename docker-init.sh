#!/bin/bash

# Prüfen ob package.json existiert
if [ ! -f "package.json" ]; then
    # Initialisiere ein minimales package.json
    echo '{
      "name": "household-costs",
      "version": "0.0.1",
      "private": true,
      "type": "module",
      "scripts": {
        "dev": "vite",
        "build": "vite build",
        "electron:dev": "NODE_ENV=development electron ."
      },
      "dependencies": {
        "electron": "^35.1.5",
        "electron-builder": "^26.0.12",
        "sqlite3": "^5.1.7",
        "vue": "^3.4.0"
      },
      "devDependencies": {
        "@vitejs/plugin-vue": "^5.2.3",
        "vite": "^6.3.0"
      }
    }' > package.json

    # Erstelle notwendige Verzeichnisse
    mkdir -p src electron
fi

# Dependencies installieren
npm install

# Development Server starten
npm run dev