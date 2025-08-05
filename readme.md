# Curso Base React - Ambiente Docker

Este projeto utiliza um ambiente Docker para executar um projeto React/Vite em modo de desenvolvimento, com Node.js e hot reload configurado.

---

## 🚀 Início Rápido

### 1. Subir o ambiente
```bash
docker compose up -d
```

### 2. Executar o servidor de desenvolvimento
```bash
docker exec -it wesllycode_myapp_dev npm run dev
```

### 3. Acessar a aplicação
- **Por padrão:** È porta 5173 se tiver ocupada use a 3000
- **Desenvolvimento:** http://localhost:3000 (ou porta alternativa se 3000 estiver ocupada)

---

## 📁 Estrutura do Projeto

```
curso-base-react/
├── app/                    # Código fonte React/Vite
│   ├── src/
│   ├── package.json
│   └── vite.config.ts
├── docker-compose.yml      # Configuração Docker Compose
├── Dockerfile             # Imagem Docker
├── entrypoint.sh          # Script de inicialização
└── nginx.conf             # Configuração Nginx
```

---

## 🛠️ Comandos Úteis

### **Gerenciamento do Container**

```bash
# Iniciar o container
docker compose up -d

# Parar o container
docker compose down

# Reconstruir e iniciar
docker compose up --build -d

# Ver logs em tempo real
docker logs -f wesllycode_myapp_dev

# Ver status dos containers
docker compose ps
```

### **Execução de Comandos no Container**

```bash
# Acessar o shell do container
docker exec -it wesllycode_myapp_dev sh

# Executar servidor de desenvolvimento
docker exec -it wesllycode_myapp_dev npm run dev

# Instalar dependências
docker exec -it wesllycode_myapp_dev npm install

# Executar build de produção
docker exec -it wesllycode_myapp_dev npm run build

# Executar linting
docker exec -it wesllycode_myapp_dev npm run lint

# Preview da build
docker exec -it wesllycode_myapp_dev npm run preview
```

### **Desenvolvimento**

```bash
# Verificar portas em uso
ss -tulpn | grep :3000

# Limpar cache do Docker
docker system prune -f

# Ver uso de recursos
docker stats

# Executar comandos npm específicos
docker exec -it wesllycode_myapp_dev npm run [comando]
```

### **Troubleshooting**

```bash
# Verificar se o container está rodando
docker ps

# Ver logs de erro
docker logs wesllycode_myapp_dev

# Reiniciar container
docker compose restart

# Forçar reconstrução da imagem
docker compose build --no-cache
```

---

## ⚙️ Configurações

### **Portas**
- **3000:** Servidor de desenvolvimento Vite
- **8080:** Servidor Nginx (produção)

### **Volumes Mapeados**
- `./app:/app` - Código fonte
- `./nginx.conf:/etc/nginx/nginx.conf` - Configuração Nginx

### **Hot Reload**
- Alterações nos arquivos são refletidas automaticamente
- Volume mapeado garante sincronização em tempo real

---

## 📦 Tecnologias

- **React 19** - Biblioteca JavaScript para interfaces
- **Vite 7** - Build tool e dev server
- **TypeScript** - Tipagem estática
- **Docker** - Containerização
- **Nginx** - Servidor web (produção)

---

## 🔧 Scripts Disponíveis

```json
{
  "dev": "vite",           // Servidor de desenvolvimento
  "build": "tsc -b && vite build",  // Build de produção
  "lint": "eslint .",      // Linting do código
  "preview": "vite preview" // Preview da build
}
```

---

## 📚 Referências

- [React Documentation](https://react.dev/)
- [Vite Documentation](https://vitejs.dev/)
- [Docker Documentation](https://docs.docker.com/)
- [TypeScript Documentation](https://www.typescriptlang.org/)
