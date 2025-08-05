import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vite.dev/config/
export default defineConfig({
  server: {
    host: '0.0.0.0', // Permite conexões externas
    //port: 5173,      // Porta padrão do Vite
    port: 3000,      // Nova porta para evitar conflitos
    strictPort: false // Permite usar porta alternativa se 3000 estiver ocupada
  },
  plugins: [react()],

})
