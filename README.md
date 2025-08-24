# ArquitecturaSFV-P1

# Evaluación Práctica - Ingeniería de Software V

## Información del Estudiante
- **Nombre:** Felipe Velasco
- **Código:** A00380555
- **Fecha:** 11 Agosto 2025

## Resumen de la Solución
Esta solución contiene una aplicación Node.js que fuecontenedorizada con Docker y desplegada automáticamente mediante un script en Bash.  
El objetivo es garantizar que la aplicación pueda ejecutarse en cualquier entorno de manera consistente, aplicando principios DevOps como automatización, portabilidad y pruebas tempranas.


## Dockerfile
- Se uso la imagen `node:18-alpine` por ser ligera, segura y ampliamente utilizada en entornos de producción.
- El Directorio de trabajo: `/usr/src/app` para mantener ordenada la aplicación dentro del contenedor.
- Las Variables de entorno:** `PORT` y `NODE_ENV` se definieron por defecto para estandarizar la ejecución.
- El Comando de arranque: `CMD ["npm", "start"]` asegura que la aplicación se ejecute automáticamente al iniciar el contenedor.


## Script de Automatización
El script implementa un flujo automatizado que:
1. Verifica que Docker este instalado
2. Compila la imagen con `docker build`.
3. Inicia el contenedor mapeando el puerto 8080 y estableciendo variables de entorno.
4. Valida que la aplicación responda correctamente usando `curl`.
5. Imprime en consola si la aplicación está corriendo o si ocurrió un error.

## Principios DevOps Aplicados
1. **Automatización:** el despliegue y validación se realizan mediante scripts sin intervención manual.  
2. **Consistencia entre entornos:** al usar contenedores, la aplicación se comporta igual en desarrollo, pruebas y producción.  
3. **Pruebas tempranas y monitoreo:** el script incluye una verificación con `curl` para detectar fallos desde el inicio.  


## Captura de Pantalla
![Imagen](captura1.png)
![Contenedor](captura1.png)
![App funcionando](captura1.png)



## Mejoras Futuras
1. Integrar un pipeline de CI/CD en GitHub Actions o GitLab CI para construir y desplegar automáticamente.  
2. Usar Docker Compose para manejar mas servicios.
3. Incorporar ests automatizados antes del despliegue para garantizar calidad en cada versión.  

## Instrucciones para Ejecutar
### Pasos
1. Clonar el repositorio:
   git clone <URL-del-repositorio>
   cd <nombre-del-proyecto>

2. Dar permisos de ejecución al script:
    chmod +x deploy.sh

3. Ejecutar el script de despliegue:
    ./deploy.sh

4. Abrir en el navegador:
    http://localhost:8080
    