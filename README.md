# ArquitecturaSFV-P1

# Evaluación Práctica - Ingeniería de Software V

## Información del Estudiante
- **Nombre:** David Malte
- **Código:** A00368867
- **Fecha:** 6/08/2025

## Resumen de la Solución
[Breve descripción de tu implementación]

## Dockerfile
![dockerfile](image.png)

El Dockerfile fue diseñado siguiendo buenas prácticas, para asegurar una imagen optimizada, reproducible y portable.

* Usa una imagen base ligera (node:18-alpine)
* Establece un directorio de trabajo organizado
* Instala solo las dependencias necesarias para producción
* Expone el puerto 8080 que usa la aplicación
* Define CMD con npm start para iniciar el servidor

## Script de Automatización
[Describe cómo funciona tu script y las funcionalidades implementadas]

## Principios DevOps Aplicados
1. Contenerización del entorno: el uso de Docker permite ejecutar la app de forma idéntica en cualquier equipo.

2. Portabilidad: la aplicación puede ser trasladada y ejecutada fácilmente en otros entornos sin necesidad de configuración adicional.

3. Estandarización: se definió una estructura clara y reutilizable para futuros desarrollos y despliegues.

## Captura de Pantalla
![Imagen](image-1.png)
![Run](image-2.png)


## Mejoras Futuras
1. Implementar un script Bash (deploy.sh) que automatice el build, run y validación del servicio.

2. Incluir pruebas automatizadas para verificar endpoints (curl, wget, o tests con frameworks).

3. Configurar un flujo CI/CD con GitHub Actions para despliegue continuo.

## Instrucciones para Ejecutar
docker build -t practice-evaluation .

docker run practice-evaluation



