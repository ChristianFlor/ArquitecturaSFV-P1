# Usa una imagen base de Node
FROM node:18
# Crea un directorio en el contenedor
WORKDIR /app

# Copia los archivos del proyecto
COPY package*.json ./
RUN npm install
COPY . .

# Expone el puerto en uso
EXPOSE 3000
# Ejecuta la app
CMD ["node", "app.js"]
