FROM node:20-alpine

WORKDIR /usr/src/app
COPY package*.json ./
COPY . .
RUN npm install

#Variables de entorno por defecto
ENV PORT=8080
ENV NODE_ENV=production

EXPOSE 8080


CMD ["node", "app.js"]
