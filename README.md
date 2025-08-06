# ArquitecturaSFV-P1

# Evaluación Práctica - Ingeniería de Software V

## Información del Estudiante
- **Nombre: Samuel Ibarra Cano**
- **Código: A003895773**
- **Fecha: Agosto / 06 / 2025**

## Resumen de la Solución
Esta solución contiene una aplicación simple desarrollada en Node.js que fue contenerizada utilizando Docker. Se creó un Dockerfile desde cero, permitiendo construir una imagen ligera y funcional que ejecuta la aplicación sin necesidad de instalar dependencias localmente.

## Dockerfile
El Dockerfile fue creado siguiendo buenas prácticas para contenerizar una aplicación Node.js, utilizando la imagen oficial node:18 por su estabilidad. Se estableció /app como directorio de trabajo y se copiaron primero los archivos package*.json para ejecutar npm install, optimizando el uso del caché de Docker. Luego se copiaron los archivos restantes, se expuso el puerto 3000 y se configuró el comando de inicio con CMD ["node", "app.js"].


## Principios DevOps Aplicados
Contenerización y Portabilidad: El uso de Docker garantiza que la aplicación se ejecute de forma idéntica en cualquier entorno.

Versionamiento y control de cambios: Uso de Git y GitHub para mantener un historial claro de cambios, facilitando la colaboración y despliegue

## Captura de Pantalla
Capturas adjuntada en la carpeta del repositorio


## Instrucciones para Ejecutar
ejecuta el comando:

docker build -t node-app-docker .

ejecuta:

docker run -p 3000:3000 node-app-docker
