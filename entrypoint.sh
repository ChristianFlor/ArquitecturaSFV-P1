#!/bin/sh
npm install

npm start &

sleep 5

echo "Haciendo prueba a /health"
wget http://localhost:3000/health && echo "Servicio activo" || echo "Servicio no activo"

wait