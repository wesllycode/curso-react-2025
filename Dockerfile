LABEL maintainer="wesllycode"

# 1. Começamos com a imagem oficial do Node.js, que tem o sistema Alpine Linux
FROM node:18-alpine

# 2. Como superusuário (root), atualizamos o sistema e instalamos Nginx e Git
#    - 'apk add' é o gerenciador de pacotes do Alpine
#    - '--no-cache' evita guardar arquivos desnecessários, mantendo a imagem pequena
RUN apk add --no-cache nginx git

# 3. Cria o diretório necessário para o Nginx rodar sem erros
RUN mkdir -p /run/nginx

# 4. Define o nosso diretório de trabalho padrão para /app
WORKDIR /app

# 5. Copia o nosso script de inicialização para dentro do container
COPY entrypoint.sh /entrypoint.sh

# 6. Dá permissão de execução para o script
RUN chmod +x /entrypoint.sh

# 7. Expõe as portas que vamos usar: 80 para Nginx, 5173 para o Vite dev server
EXPOSE 80 5173

# 8. Define o nosso script como o comando principal que será executado quando o container iniciar
ENTRYPOINT ["/entrypoint.sh"]


