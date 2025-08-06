IMAGE_NAME="devops-evaluation-image"
CONTAINER_NAME="devops-evaluation-container"

echo "Verificando si Docker está instalado..."
if ! command -v docker &> /dev/null; then
    echo "Docker no está instalado. Instálalo para continuar."
    exit 1
fi

echo "Docker está disponible."

echo "Construyendo la imagen Docker..."
docker build -t $IMAGE_NAME .

if [ $? -ne 0 ]; then
    echo "Error durante la construcción de la imagen."
    exit 1
fi

echo "Imagen construida correctamente."

docker rm -f $CONTAINER_NAME &> /dev/null

echo "Ejecutando el contenedor..."
docker run -d \
  --name $CONTAINER_NAME \
  -e PORT=8080 \
  -e NODE_ENV=production \
  -p 8080:8080 \
  $IMAGE_NAME

sleep 3

echo "Verificando el estado del servicio con /health..."
STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8080/health)

if [ "$STATUS" -eq 200 ]; then
  echo "Aplicación funcionando correctamente (HTTP 200)"
else
  echo "La aplicación no respondió correctamente. Código: $STATUS"
  exit 1
fi

echo "Resumen:"
docker ps | grep $CONTAINER_NAME