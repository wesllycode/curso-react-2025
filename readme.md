# Ambiente Docker: React/Vite + Node + Hot Reload

Este guia explica como montar um ambiente Docker para executar um projeto React/Vite em modo de desenvolvimento, utilizando Node.js e Vite com hot reload.

---

## 1. Estrutura dos arquivos

- `Dockerfile`
- `docker-compose.yml`
- `entrypoint.sh`
- `app/` (diretório do seu projeto React/Vite)

---

## 2. Suba o container

Execute o comando abaixo para construir a imagem e iniciar o container:

```shell
docker-compose up --build
```

---

## 3. Rode o Vite em modo desenvolvimento dentro do container

Com o volume mapeado (`./app:/app`), entre no container:

```shell
docker exec -it dev_container sh
```

Instale as dependências e rode o servidor de desenvolvimento do Vite:

```shell
cd /app
npm install
npm run dev
```

---

## 4. Acesse o projeto pelo navegador

Acesse [http://localhost:5173](http://localhost:5173) para visualizar sua aplicação React/Vite com hot reload.

- Toda alteração feita nos arquivos em `app/` será refletida automaticamente no navegador.
- O volume mapeado garante que alterações feitas localmente fiquem disponíveis no container em tempo real.

---

## Observações

- Não é necessário rodar `npm run build` para desenvolvimento; basta usar `npm run dev`.
- O Nginx não é necessário para o ambiente de desenvolvimento com Vite, apenas para produção.
- Para acessar o Vite via navegador, use a porta `5173` (ou configure outra porta em `vite.config.js`).

---

## Referências

- [Documentação oficial do Docker](https://docs.docker.com/)
- [React](https://react.dev/)
- [Vite](https://vitejs.dev/)
