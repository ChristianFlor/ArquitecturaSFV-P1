# ArquitecturaSFV-P1

# Evaluación Práctica - Ingeniería de Software V

## Información del Estudiante
- **Davide Flamini Cazaran:**
- **A00381665:**
- **6/08/2025:**

## Resumen de la Solución

Cree un contenedor con una imagen de node donde instalo las dependencias y se puede correr el proyecto en el contenedor.



## Dockerfile

Lo que hice fue usar una imagen base para compilar la aplicacion, usando la imagen de node: 

FROM node:18

Luego cree un directorio para la aplicacion en el contenedor:

WORKDIR /app 

luego copie el package.json al contenedor e instale las dependencias:

COPY package.json .

En este paso tambien se suele copiar el package-lock.json. Cabe aclarar que primero se copian las dependencias para asegurar que si ninguna dependencia no se ha cambiado no vuelva a ejecutar el npm install.

RUN npm install 

Por ultimo, copie el resto de codigo fuente al contenedor, expuse el puerto 3000 y ejecute el servidor de node:

COPY . .

EXPOSE 3000

CMD ["npm", "start"]

## Script de Automatización
[Describe cómo funciona tu script y las funcionalidades implementadas]

## Principios DevOps Aplicados
1. [Principio 1]
2. [Principio 2]
3. [Principio 3]

## Captura de Pantalla

A continuación, se muestran capturas de pantalla de la aplicación funcionando en el contenedor:

![Captura de Pantalla 1](Screenshot%202025-08-06%20at%208.36.47%E2%80%AFAM.png)

![Captura de Pantalla 2](Screenshot%202025-08-06%20at%208.36.57%E2%80%AFAM.png)

![Captura de Pantalla 3](Screenshot%202025-08-06%20at%208.37.11%E2%80%AFAM.png)

![Captura de Pantalla 4](Screenshot%202025-08-06%20at%208.37.24%E2%80%AFAM.png)

## Mejoras Futuras

Podria implementar lo de añadir el package-lock.json, hacer el script de automatizacion y tal vez usar una version mas liviana de node.

## Instrucciones para Ejecutar

Construyes la imagen (ponerle un tag):

docker build -t ingeapp .

Verificas que se construyo:

docker images

Corres la imagen (no olvidar mapear los puertos):

docker run -p 3000:3000 ingeapp