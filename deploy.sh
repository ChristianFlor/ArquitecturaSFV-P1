#!/bin/bash

# Variables
IMAGE_NAME="miapp-node"
PORT=8080
NODE_ENV=production

echo "=== Verificando instalación de Docker ==="
if ! command -v docker &> /dev/null
then
    echo "Docker no está instalado. Por favor instálalo antes de continuar."
    exit 1
fi

echo "=== Construyendo imagen de Docker ==="
docker build -t $IMAGE_NAME .

if [ $? -ne 0 ]; then
    echo "Error al construir la imagen."
    exit 1
fi

echo "=== Ejecutando contenedor ==="
docker run -d -p $PORT:$PORT -e PORT=$PORT -e NODE_ENV=$NODE_ENV --name ${IMAGE_NAME}_container $IMAGE_NAME

sleep 3

echo "=== Probando el servicio ==="
RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:$PORT)

if [ "$RESPONSE" -eq 200 ]; then
    echo "✅ Aplicacion funcionando correctamente en el puerto $PORT"
    exit 0
else
    echo "❌ La aplicacion no respondió correctamente. Código HTTP: $RESPONSE"
    exit 1
fi
