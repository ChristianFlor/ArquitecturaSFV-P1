#!/bin/bash

IMAGE="devops-evaluacion"
CONTAINER="devops-app"

docker build -t $IMAGE .

docker run -d --name $CONTAINER \
    -p 8080:8080 \
    -e PORT=8080 \
    -e NODE_ENV=production \
    $IMAGE


sleep 3
if curl -s http://localhost:8080/health | grep -q "OK"; then
    echo "El servicio está funcionando."
else
    echo "El servicio no respondió correctamente."
fi
