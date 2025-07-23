#!/bin/sh
echo ">>> Entrypoint.sh foi iniciado em $(date)"

echo "Corrigindo permissões dentro do container..."
   chown -R "$(id -u):$(id -g)" /app
   chmod -R a+rw /app

# Inicia o serviço do Nginx em modo "daemon" (segundo plano)
nginx -g 'daemon on;'

# Este comando é o truque para manter o container rodando indefinidamente.
# Ele impede que o container saia após iniciar o Nginx.

if [ -f "package.json" ]; then
  npm install
  npm run dev
else
  echo "⚠️ Nenhum package.json encontrado em /app. Inicialize seu projeto React/Vite antes de rodar o dev server."
  tail -f /dev/null
fi