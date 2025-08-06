#!/bin/bash

APP_NAME="node-app"
IMAGE_NAME="node-app"
CONTAINER_NAME="node-app"
PORT=8080

if ! command -v docker &> /dev/null; then
  exit 1
fi


docker build -t $IMAGE_NAME .

if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
  docker rm -f $CONTAINER_NAME
fi

docker run -d \
  --name $CONTAINER_NAME \
  -p $PORT:8080 \
  -e PORT=8080 \
  -e NODE_ENV=production \
  $IMAGE_NAME

sleep 3

if curl -s http://localhost:8080 | grep -i "hello"; then
  echo "Servicio activo."
else
  echo "El servicio no respondió"
fi
