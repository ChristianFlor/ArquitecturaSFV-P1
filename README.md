# ArquitecturaSFV-P1

# Evaluación Práctica - Ingeniería de Software V

## Información del Estudiante
- **Nombre:Gerson de Jesus Hurtado**
- **Código:A00394995**
- **Fecha:6/08/2025**

## Resumen de la Solución
Esta solución implementa una aplicación Node.js con Express containerizada usando Docker, la aplicación tiene un ednpoint basico 

## Dockerfile
Las decisiones tomadas en la creación del Dockerfile incluyen:

- **Imagen base**: Node.js 18 Alpine para reducir el tamaño de la imagen
- **Variables de entorno**: Configuración de NODE_ENV y PORT para producción
- **Multi-stage**: Instalación de dependencias 

## Script de Automatización
Se implementó un script de automatización simplificado:

### PowerShell (Windows) - `docker-automation.ps1`
- **build**: Construye la imagen Docker
- **run**: Ejecuta el contenedor con configuración optimizada
- **stop**: Detiene y limpia el contenedor


## Principios DevOps Aplicados
1. **Infrastructure as Code (IaC)**: Dockerfile define la infraestructura de una manera declarativa
2. **Automatización**: Scripts para automatizar build, el run y el stop

## Captura de Pantalla

### Aplicación funcionando en el contenedor
![Aplicación DevOps en Docker](./imagenes/app-funcionando.png)

*La imagen muestra la aplicación Node.js ejecutándose exitosamente en el contenedor Docker, respondiendo en el puerto 3000.*

## Mejoras Futuras
1. **Implementación de CI/CD**: Integrar con GitHub Actions para automatizar el build y deployment
2. **Monitoreo avanzado**: Añadir métricas con Prometheus y dashboards con Grafana
3. **Seguridad mejorada**: Implementar escaneo de vulnerabilidades en las imágenes Docker

## Instrucciones para Ejecutar

### Prerrequisitos
- Docker instalado en el sistema
- PowerShell

### Pasos para ejecutar:

#### Usando PowerShell (Windows):
```powershell
# 1. Navegar al directorio del proyecto
cd "c:\Users\gdjhb\Downloads\ArquitecturaSFV-P1"

# 2. Dar permisos de ejecución al script
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# 3. Construir la imagen
.\docker-automation.ps1 build

# 4. Ejecutar el contenedor
.\docker-automation.ps1 run

# 5. Para detener el contenedor
.\docker-automation.ps1 stop
```

#### Usando comandos Docker directos:
```bash
# 1. Construir la imagen
docker build -t nodeapp:latest .

# 2. Ejecutar el contenedor
docker run -d --name nodeapp-container -p 3000:3000 nodeapp:latest

# 3. Verificar que esté funcionando
curl http://localhost:3000/health
```

### Endpoints disponibles:
- **GET /**: Información principal de la aplicación
- **GET /health**: Health check endpoint

### Comandos adicionales del script:
- `.\docker-automation.ps1 build` - Construir imagen
- `.\docker-automation.ps1 run` - Ejecutar contenedor
- `.\docker-automation.ps1 stop` - Detener contenedor
