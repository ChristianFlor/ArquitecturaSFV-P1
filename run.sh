#!/bin/bash

# Verifica si Docker está instalado
if ! command -v docker &> /dev/null; then
    echo "Docker no está instalado. Por favor, instálalo primero."
    exit 1
fi

# Construir la imagen
echo "Construyendo imagen de Docker..."
docker build -t devops-evaluation-app .

# Eliminar contenedores anteriores (si existen)
docker rm -f devops-evaluation-container 2> /dev/null

# Ejecutar el contenedor
echo "Iniciando el contenedor..."
docker run -d --name devops-evaluation-container -p 8080:8080 -e PORT=8080 -e NODE_ENV=production devops-evaluation-app

# Esperar unos segundos a que arranque
sleep 3

# Prueba de salud
echo "Verificando si el servicio responde..."
if curl -s http://localhost:8080/health | grep -q "OK"; then
    echo "Aplicación en funcionamiento correctamente"
    echo "Accede a la aplicación en: http://localhost:8080"
    echo "Endpoint de salud: http://localhost:8080/health"
    echo ""
    echo "Logs del contenedor:"
    docker logs devops-evaluation-container
    echo ""
    echo "Para detener el contenedor ejecuta: docker stop devops-evaluation-container"
    echo ""
    read -p "Presiona Enter para continuar..."
    exit 0
else
    echo "La aplicación no respondió correctamente"
    echo ""
    echo "Logs del contenedor:"
    docker logs devops-evaluation-container
    echo ""
    read -p "Presiona Enter para continuar..."
    exit 1
fi
