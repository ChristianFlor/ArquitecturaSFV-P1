# ArquitecturaSFV-P1

# Evaluación Práctica - Ingeniería de Software V

## Información del Estudiante
- **Nombre:**
- **Código:**
- **Fecha:**

## Resumen de la Solución
Se realizó un Dockerfile en base a un tutorial. Este contiene el proceso para crear una imagen para la aplicacion en node.

## Dockerfile
Se usa node 18-alpine debido a que es una versione recomendada (a diferencia del 10-alpine del tutorial)
El primer run busca crear un usuario con permisos limitados por seguridad de no usar erroneamente un usuario root
Se copian los packages json
se establece el usuario previamente creado como USER
se corre npm i
se copian los permisos del usuario node a la imagen


## Script de Automatización
[Describe cómo funciona tu script y las funcionalidades implementadas]

## Principios DevOps Aplicados
1. [Principio 1]
2. [Principio 2]
3. [Principio 3]

## Captura de Pantalla
[Incluye al menos una captura de pantalla que muestre tu aplicación funcionando en el contenedor]

## Mejoras Futuras
[Describe al menos 3 mejoras que podrían implementarse en el futuro]

## Instrucciones para Ejecutar
[Instrucciones paso a paso para ejecutar tu solución]
