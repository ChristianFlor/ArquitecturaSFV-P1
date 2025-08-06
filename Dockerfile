# Usa una imagen base oficial de Node.js
FROM node:18-alpine

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /usr/src/app

# Copia los archivos necesarios
COPY package*.json ./
RUN npm install

COPY . .

# Define la variable de entorno por defecto
ENV NODE_ENV=production

# Expone el puerto en el que corre la app
EXPOSE 8080

# Comando para iniciar la aplicación
CMD [ "npm", "start" ]
