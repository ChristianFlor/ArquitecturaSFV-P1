# ArquitecturaSFV-P1

# Evaluación Práctica - Ingeniería de Software V

## Información del Estudiante
- **Nombre:**
    Santaigo Arboleda Velasco
- **Código:**
    A00369824
- **Fecha:**
06/08/2025

## Resumen de la Solución
Desarrolle una solucion de una app de Node, con Docker donde construyo una imagen y ejecuto un contenedor.


## Dockerfile
- Lo que hice fue usar una imagen de node la cual es node:18
- Coloque un workdir, el cual es el directorio de trabajo que se llama app
- Al igual use el COPY para tener todas las dependencias del package.json de la app para luego correrlas con npm install e instalarlas
- Copie el codigo fuente con el siguiente COPY
- Por ultimo use el CMD para correr npm start e iniciar la app

## Script de Automatización
[Describe cómo funciona tu script y las funcionalidades implementadas]

## Principios DevOps Aplicados
1. Estandarizar el proceso de despliegue evitando errores en la configuracion.
2. Desarrollo de codigos de insfraestructura como scripts con las mismas practicas que el codigo.


## Captura de Pantalla
![alt text](image.png)

## Mejoras Futuras
- Realizar el tema de los scripts
- Agregarle mas cosas a la app como una interfaz
- Implementarle mas cosas de buenas practicas de docker




## Instrucciones para Ejecutar
1) docker build -t nodeapp .
2) docker run -p 3000:3000 nodeapp
