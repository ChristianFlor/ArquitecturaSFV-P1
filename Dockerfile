# Imagen base
FROM node:18-alpine

# Carpeta dentro del contenedor
WORKDIR /usr/src/app

# Copiar dependencias
COPY package*.json ./

# Instalar dependencias
RUN npm install --production

# Copiar el resto del código
COPY . .

# Exponer el puerto que usará la app
EXPOSE 8080

# Variable de entorno por defecto
ENV NODE_ENV=production

# Comando para ejecutar
CMD ["node", "app.js"]
