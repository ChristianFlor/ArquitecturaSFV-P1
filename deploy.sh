#!/bin/bash

echo "🚀 Verificando si Docker está instalado..."

if ! command -v docker &> /dev/null; then
  echo "❌ Docker no está instalado. Aborta."
  exit 1
fi

echo "✅ Docker está instalado."

echo "🔧 Construyendo imagen..."
docker build -t node-app .

if [ $? -ne 0 ]; then
  echo "❌ Error al construir la imagen."
  exit 1
fi

echo "🧹 Eliminando contenedor anterior si existe..."
docker rm -f contenedor-eval 2>/dev/null

echo "🐳 Ejecutando contenedor..."
docker run -d -p 8080:8080 --name contenedor-eval -e PORT=8080 -e NODE_ENV=production node-app

echo "⌛ Esperando que la app arranque..."
sleep 3

echo "🧪 Probando servicio..."

RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8080)

if [ "$RESPONSE" -eq 200 ]; then
  echo "✅ Aplicación responde correctamente (HTTP 200)."
else
  echo "❌ Error: aplicación no responde. Código: $RESPONSE"
  exit 1
fi
