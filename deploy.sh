#!/bin/bash


# Script de Despliegue DevOps


APP_NAME="devops-app"
IMAGE_NAME="devops-app-image"
CONTAINER_NAME="devops-app-container"
PORT=8080
NODE_ENV=production

echo "Verificando si Docker está instalado..."

if ! command -v docker &> /dev/null; then
  echo "Docker no está instalado. Por favor instálalo y vuelve a intentarlo."
  exit 1
fi

echo "Docker está instalado."

# Construir imagen
echo "Construyendo imagen Docker..."
docker build -t $IMAGE_NAME .

if [ $? -ne 0 ]; then
  echo "Error al construir la imagen."
  exit 1
fi

echo "Imagen construida exitosamente: $IMAGE_NAME"

# Eliminar contenedor previo si existe
if docker ps -a | grep -q $CONTAINER_NAME; then
  echo "Eliminando contenedor anterior..."
  docker rm -f $CONTAINER_NAME > /dev/null
fi

# Ejecutar contenedor
echo "Ejecutando contenedor..."
docker run -d \
  --name $CONTAINER_NAME \
  -e PORT=$PORT \
  -e NODE_ENV=$NODE_ENV \
  -p $PORT:8080 \
  $IMAGE_NAME

if [ $? -ne 0 ]; then
  echo "Error al ejecutar el contenedor."
  exit 1
fi

# Esperar unos segundos para que arranque
echo "Esperando a que el servicio inicie..."
sleep 3

# Probar el servicio
echo "Verificando si el servicio responde..."
RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:$PORT/health)

if [ "$RESPONSE" == "200" ]; then
  echo "Servicio responde correctamente en http://localhost:$PORT"
  STATUS="Éxito"
else
  echo "El servicio no respondió correctamente. Código HTTP: $RESPONSE"
  STATUS="Error"
fi

# Resumen final
echo ""
echo "=============================="
echo "Resumen del despliegue"
echo "=============================="
echo "Imagen: $IMAGE_NAME"
echo "Contenedor: $CONTAINER_NAME"
echo "Puerto: $PORT"
echo "Entorno: $NODE_ENV"
echo "Estado: $STATUS"
echo "=============================="
