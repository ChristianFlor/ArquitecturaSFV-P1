FROM node:22-alpine

WORKDIR /ARQUITECTURASFV_P1/

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["node", "app.js"]