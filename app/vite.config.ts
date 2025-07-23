import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vite.dev/config/
export default defineConfig({
  server: {
    host: '0.0.0.0', // Permite conexões externas
    port: 5173,      // Porta que será utilizada
    strictPort: true // Garante uso dessa porta
  },
  plugins: [react()],

})
