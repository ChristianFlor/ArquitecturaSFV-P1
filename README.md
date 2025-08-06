# ArquitecturaSFV-P1

# Evaluación Práctica - Ingeniería de Software V

## Información del Estudiante
- **Nombre:** Alejandro Castro
- **Código:** A00372470
- **Fecha:** 6/08/2025

## Resumen de la Solución
Esta solución contiene la contenerización de una aplicación Node.js utilizando Docker. Se creó un Dockerfile optimizado, se construyó manualmente una imagen, se ejecutó un contenedor configurando las variables de entorno necesarias y se verificó que la aplicación funcionó correctamente. Esta solución aplica principios fundamentales de DevOps como consistencia de entornos, despliegue reproducible y portabilidad.

## Dockerfile
```dockerfile
FROM node:18

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install --production

COPY . .

ENV PORT=8080
ENV NODE_ENV=production

EXPOSE 8080

CMD ["node", "app.js"]
```
Imagen base: Se usó node:18 por su estabilidad y compatibilidad.
Instalación optimizada: Se utilizó npm install --production para instalar solo las dependencias necesarias, reduciendo el tamaño de la imagen.
Variables de entorno: Se configuraron PORT=8080 y NODE_ENV=production para simular un entorno productivo.
Estructura del contenedor: Uso de WORKDIR y copia ordenada de archivos para facilitar el mantenimiento y futuras optimizaciones.

## Script de Automatización
No se realizó el scrip de automatización

## Principios DevOps Aplicados
Contenerización: A través de Docker, se garantiza que la aplicación se ejecute de forma idéntica en cualquier entorno.

Consistencia y Reproducibilidad: El Dockerfile permite reconstruir la aplicación en cualquier momento de forma confiable.

Portabilidad: El contenedor puede desplegarse en cualquier sistema que tenga Docker, sin necesidad de instalar Node.js localmente.

## Captura de Pantalla
![Image](https://github.com/AIejoCastro/ArquitecturaSFV-P1/blob/main/image.png)

## Mejoras Futuras
Incorporar un script de automatización (bash) que realice el build, run y verificación.

Integrar pruebas automáticas con un framework como Jest.

Configurar CI/CD con GitHub Actions o similar para automatizar builds y pruebas.

## Instrucciones para Ejecutar
Construcción de la imagen Docker:
```
docker build -t miapp-nodejs .
```

Ejecución del contenedor:
```
docker run -d -p 8080:8080 --name mi-contenedor miapp-nodejs
```

Verificación de funcionamiento:
```
curl http://localhost:8080
```
