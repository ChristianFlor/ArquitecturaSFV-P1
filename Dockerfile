FROM node:22-alpine

WORKDIR /usr/src/app

COPY . .


ENV PORT=3000
EXPOSE $PORT


RUN npm install
CMD ["node", "app.js"]