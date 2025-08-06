# ArquitecturaSFV-P1

# Evaluación Práctica - Ingeniería de Software V

## Información del Estudiante
- **Nombre:** Luis Manuel Rojas Correa
- **Código:** A0039989
- **Fecha:** Aug 6 2025

## Resumen de la Solución
A simple docker file was written in order to run a node js app
that uses express: simple server with an json response.



## Dockerfile

In order to correctly use node the image node:18-alpine
was included (this image has all the dependencies and requirements to
run any node application). Then the working direction of the app was
set, as also the json package copied in order to include any config
information of the app. Then the RUN command was specified, telling that 
once the docker image is settiing up it will need to run the command npm install, and finally the service was exposed in the port 3000. 


## Script de Automatización

A simple bash script was written to automate the deployment process. The script verifies that docker is installed and running, then automatically builds the image and runs the container with NODE_ENV=production mapping port 8080 externally to port 3000 internally. 

It tests connectivity using curl in a loop up to 10 attempts and provides a status report showing success or error with container logs.


## Principios DevOps Aplicados

Automation: The bash script automates the entire deployment process from image building to container execution and testing, eliminating manual steps and reducing human error.

Infrastructure as Code: The Dockerfile defines the application environment and dependencies in a declarative way, making the infrastructure reproducible and versionable.

Environment Consistency: Containerization with Docker ensures the application runs identically across different environments (development, staging, production) regardless of the host system.

## Captura de Pantalla
[Incluye al menos una captura de pantalla que muestre tu aplicación funcionando en el contenedor]

## Mejoras Futuras
[Describe al menos 3 mejoras que podrían implementarse en el futuro]

## Instrucciones para Ejecutar

Clone or download this repository to your local machine

Navigate to the project directory: cd ArquitecturaSFV-P1

Make the script executable: chmod +x deploy.sh

Run the deployment script: ./deploy.sh

The script will automatically build the image, run the container, and test connectivity

Once successful, access the application at: http://localhost:8080
To stop the container: sudo docker stop devops-app
