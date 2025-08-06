FROM node

WORKDIR /app_image

RUN mkdir -p node_modules

COPY package*.json ./

RUN npm install

COPY . .

RUN chown -R node:node /app_image

USER node

EXPOSE 8080

CMD [ "node", "app.js" ]