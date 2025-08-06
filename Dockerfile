# Usar una imagen base ligera de Node.js
FROM node:18-alpine

# Establecer el directorio de trabajo en el contenedor
WORKDIR /usr/src/app

# Copiar solo los archivos necesarios para instalar dependencias
COPY package*.json ./

# Instalar dependencias
RUN npm install --production

# Copiar el resto del código fuente de la app
COPY . .

# Exponer el puerto en el que corre la app
EXPOSE 8080

# Definir el comando que inicia la aplicación
CMD ["npm", "start"]
