#!/bin/sh

# Inicia o nginx em background (não bloqueante)
nginx -g 'daemon off;' &

# Vai para o diretório da aplicação
cd /app || exit 1

# Se não houver node_modules instalados, instala as dependências.
# Usa npm ci quando existir package-lock.json para builds reprodutíveis.
if [ ! -d "node_modules" ]; then
  if [ -f package-lock.json ]; then
    echo "Instalando dependências (npm ci)..."
    npm ci --no-audit --no-fund --silent || npm install --no-audit --no-fund --silent
  else
    echo "Instalando dependências (npm install)..."
    npm install --no-audit --no-fund --silent
  fi
fi

# Inicia a aplicação React (modo dev). Em produção você poderia rodar um build e servir com nginx.
npm run dev
