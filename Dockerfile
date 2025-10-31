FROM node:20-alpine

# Adiciona dependências necessárias
RUN apk add --no-cache libc6-compat

# Cria usuário não-root para segurança
RUN addgroup -g 1001 -S nodejs \
    && adduser -S nodeuser -u 1001

# Define diretório de trabalho
WORKDIR /app

# Instala dependências primeiro (melhor uso de cache)
COPY app/package.json ./
RUN npm install

# Copia arquivos do projeto
COPY --chown=nodeuser:nodejs app/ .

# Configura usuário não-root
USER nodeuser

# Expõe porta do Vite
EXPOSE 5173

# Healthcheck para verificar se o serviço está respondendo
HEALTHCHECK --interval=30s --timeout=3s \
    CMD wget --no-verbose --tries=1 --spider http://localhost:5173/ || exit 1

# Comando para desenvolvimento
CMD ["npm", "run", "dev", "--", "--host"]
