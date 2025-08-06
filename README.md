# ArquitecturaSFV-P1

# Evaluación Práctica - Ingeniería de Software V

## Información del Estudiante
- **Nombre: Nayeli Suarez**
- **Código: A00382425**
- **Fecha: 8/06/2025**

# Evaluación Práctica - Ingeniería de Software V

## Contenerización
Se creó un `Dockerfile` para ejecutar una aplicación Node.js dentro de un contenedor.

## Script de Automatización
Script `deploy.sh` que:
- Verifica si Docker está instalado
- Construye la imagen
- Ejecuta el contenedor con variables de entorno
- Verifica si responde correctamente

## DevOps aplicados
- **Contenerización**: Docker permite portar la app fácilmente a cualquier ambiente.
- **Automatización**: Con un solo script se realiza todo el despliegue.
- **Consistencia**: Mismo resultado en cualquier máquina con Docker.

## Mejoras futuras
- Añadir pruebas unitarias
- Usar Docker Compose
- Integrar a un pipeline CI/CD con GitHub Actions
