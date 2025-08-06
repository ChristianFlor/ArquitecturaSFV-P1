#!/bin/bash

if ! command -v docker &> /dev/null; then
    echo "Docker no está instalado. Instálelo y vuelva a intentarlo."
    exit 1
fi

echo "Docker está instalado."

echo "Construyendo la imagen..."
docker build -t devops-evaluation-app .

if [ $? -ne 0 ]; then
    echo "Error al construir la imagen."
    exit 1
fi

echo "Ejecutando el contenedor..."
docker run -d \
    --name contenedor-devops \
    -p 8080:8080 \
    -e PORT=8080 \
    -e NODE_ENV=production \
    devops-evaluation-app

sleep 3

echo "Verificando el servicio..."
RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8080/health)

if [ "$RESPONSE" -eq 200 ]; then
    echo "El servicio está funcionando correctamente."
else
    echo "El servicio no respondió correctamente. Código HTTP: $RESPONSE"
    exit 1
fi
