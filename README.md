# ArquitecturaSFV-P1

# Evaluación Práctica - Ingeniería de Software V

## Información del Estudiante
- **Nombre: DAVID HENAO SALAZAR**
- **Código: A00394033**
- **Fecha: 06/08/25**

## Resumen de la Solución
[Breve descripción de tu implementación]

Creacion de contenedor de docker para una pagina de prueba de "evaluacion de DevOps" o eso creo, mediante nodejs

## Dockerfile
[Explica las decisiones tomadas en la creación del Dockerfile]

Yendo a lo crucialmente usado dentro de las instrucciones, al momento de crear se estableció la version a usar de node para la ejecucion de la app (en mi caso 22), tambien que leyera e instalara las dependencias necesarias mediante npm install y a partir del contenido del package.json, y posteriormente que usara comandos para la ejecucion del node (literalmenten node app.js) y que esté expuesto en el 3000

## Script de Automatización
[Describe cómo funciona tu script y las funcionalidades implementadas]

No alcancé a crearlo, por lo que no tenemos script de auto

## Principios DevOps Aplicados
1. [Principio 1] : Infraestructura como codigo o IaC 
2. [Principio 2] : no hay mas 
3. [Principio 3] :

## Captura de Pantalla
[Incluye al menos una captura de pantalla que muestre tu aplicación funcionando en el contenedor]
![alt text](image.png)

## Mejoras Futuras
[Describe al menos 3 mejoras que podrían implementarse en el futuro]

Primeramente la automatizacion del script para el dockerfile, luego conectar una base de datos en un subcontenedor, y tambien puede ser establecer un entorno virtual para la ejecucion

## Instrucciones para Ejecutar
[Instrucciones paso a paso para ejecutar tu solución]

primero se debe de confirmar que el Dockerfile esté allí (junto con la serie de pasos establecidos), si es el caso desde el mismo  punto de la carpeta se utiliza por consola el comando docker build -t node-app . (puede tener otro nombre como tag) y luego si es exitoso (puede no serlo por diferencia de versiones de node) se hace el comando docker run -p 8080:8080 -e PORT=8080 -e NODE_ENV=production --name dev_ops_app node-app, en el que establecemos el puerto a usar, el node_env y un nombre para el contenedor, ademas de la imagen a usar de docker. una vez hecho esto y para verificar que funcione se puede utilizar el comando docker ps o curl http://localhost:8080/health
