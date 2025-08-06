# ArquitecturaSFV-P1

# Evaluación Práctica - Ingeniería de Software V

## Información del Estudiante
- **Nombre:** Juan Felipe Jojoa Crespo
- **Código:** A00382042
- **Fecha:** 08/06/2025

## Resumen de la Solución

Se desarrolló una solución que permite ejecutar una aplicación basada en Node.js dentro de un contenedor Docker. La implementación incluye un `Dockerfile` personalizado y un script de automatización (`deploy.sh`) que simplifica el proceso de construcción e implementación del contenedor. Esta solución se diseñó siguiendo buenas prácticas DevOps para garantizar portabilidad, repetibilidad y facilidad de despliegue.

---

## Dockerfile

El `Dockerfile` fue diseñado para crear una imagen ligera y eficiente basada en Node.js. Se utilizó una imagen oficial como base (`node:18-alpine`) para reducir el tamaño final del contenedor.
Se copian los archivos de la aplicación al contenedor, se instalan las dependencias mediante `npm install`, y se define un comando de inicio con `npm start`. Además, se expone el puerto `8080` para permitir el acceso externo a la aplicación.

---

## Script de Automatización

El script `deploy.sh` automatiza el proceso completo de despliegue. Sus funciones principales incluyen:

* Verificar si Docker está instalado y disponible.
* Construir la imagen Docker usando el Dockerfile.
* Ejecutar el contenedor con nombre personalizado, en segundo plano y con el puerto mapeado.
* Realizar una solicitud HTTP para comprobar que la aplicación está funcionando correctamente dentro del contenedor.
  Este enfoque permite al usuario desplegar la solución con un solo comando, ahorrando tiempo y evitando errores manuales.

---

## Principios DevOps Aplicados

1. **Contenerización**: Se encapsula la aplicación para asegurar portabilidad entre entornos sin depender del sistema operativo o configuración local.
2. **Automatización del Despliegue**: El script evita tareas manuales repetitivas, reduciendo errores humanos.
3. **Consistencia entre entornos**: Garantiza que la aplicación funcione de la misma forma en cualquier equipo con Docker instalado, desde desarrollo hasta producción.

---

## Mejoras Futuras

1. **Agregar pruebas automatizadas** para verificar que la app funciona correctamente antes de ser contenerizada.
2. **Incluir Docker Compose** para facilitar el despliegue conjunto con otros servicios, como bases de datos.
3. **Integración con herramientas de CI/CD**, por ejemplo GitHub Actions, para ejecutar el script de despliegue automáticamente al hacer cambios en el repositorio.

   