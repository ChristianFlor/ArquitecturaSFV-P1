# ArquitecturaSFV-P1

# Evaluación Práctica - Ingeniería de Software V

## Información del Estudiante
- **Nombre: Daron Mercado**
- **Código: A00395421**
- **Fecha: 6/08/2025**

## Resumen de la Solución
Creé un Dockerfile y dentro elegí la versión de node (18), luego establecí el directorio de trabajo, se copiaron el package.json, expuse el puerto 3000 por donde va a correr la app y luego se le dice el comando para ejecutar 

## Dockerfile
En la contrucción del Dockerfile no tuve ningún problema hasta que puse el comando CMD ["npm", "run"], pues no me había fijado que en el package.json estaba con start, se cambió y se volvió a contruir y todo funcionó.

## Script de Automatización
[Describe cómo funciona tu script y las funcionalidades implementadas]

## Principios DevOps Aplicados
1. Estandarizar el proceso de despliegue para Dev y Ops
2. Desarrollo de códigos de infraestuctura como stcripts con las mismas prácticas que el código de aplicación
3. [Principio 3]

## Captura de Pantalla
Contruyendo:
![alt text](image.png)

Corriendo:
![alt text](image-1.png)

Verificación:
![alt text](image-2.png)



## Mejoras Futuras
Implementar una versión de node más liviana como por ejemplo alpine.

## Instrucciones para Ejecutar
docker build -t nodeapp .
docker run -p 3000:3000 nodeapp
