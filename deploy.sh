#!/bin/bash

IMAGE_NAME="node-app-img"
CONTAINER_NAME="node-app-container"
PORT=8080

echo "Iniciando despliegue..."

# Verificar Docker instalado
if ! command -v docker &> /dev/null
then
    echo "❌ Docker no está instalado."
    exit 1
else
    echo "✅ Docker está instalado."
fi

# Eliminar contenedor existente
if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo "Eliminando contenedor anterior..."
    docker rm -f $CONTAINER_NAME
fi

# Construir imagen
echo "Construyendo imagen..."
docker build -t $IMAGE_NAME .
if [ $? -ne 0 ]; then
    echo "❌ Error al construir imagen."
    exit 1
fi

# Ejecutar contenedor
echo "Ejecutando contenedor..."
docker run -d -p $PORT:$PORT --name $CONTAINER_NAME -e PORT=$PORT -e NODE_ENV=production $IMAGE_NAME
if [ $? -ne 0 ]; then
    echo "❌ Error al ejecutar contenedor."
    exit 1
fi

# Tiempo de espera
sleep 3

# Probar servicio
echo "Verificando servicio..."
STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:$PORT)

if [ $STATUS -eq 200 ]; then
    echo "✅ Servicio activo (HTTP $STATUS)"
else
    echo "❌ Fallo en servicio (HTTP $STATUS)"
    exit 1
fi
