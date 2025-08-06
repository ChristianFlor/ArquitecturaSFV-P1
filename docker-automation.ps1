# Gerson de Jesus Hurtado - A00394995


param(
    [Parameter(Position=0)]
    [string]$Command = "help"
)

$ImageName = "nodeapp"
$ContainerName = "nodeapp-container"
$Port = 3000

function Show-Help {
    Write-Host "=== Script de Automatización DevOps ===" -ForegroundColor Blue
    Write-Host "Uso: .\docker-automation.ps1 [COMANDO]" -ForegroundColor Green
    Write-Host ""
    Write-Host "Comandos disponibles:"
    Write-Host "  build     - Construir la imagen Docker" -ForegroundColor Yellow
    Write-Host "  run       - Ejecutar el contenedor" -ForegroundColor Yellow
    Write-Host "  stop      - Detener el contenedor" -ForegroundColor Yellow
    Write-Host "  help      - Mostrar esta ayuda" -ForegroundColor Yellow
}

function Build-Image {
    Write-Host "Construyendo imagen Docker..." -ForegroundColor Blue
    docker build -t "${ImageName}:latest" .
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Imagen construida exitosamente" -ForegroundColor Green
    } else {
        Write-Host "Error al construir la imagen" -ForegroundColor Red
        exit 1
    }
}

function Start-Container {
    Write-Host "Iniciando contenedor..." -ForegroundColor Blue
    
    $existingContainer = docker ps -q -f name=$ContainerName
    if ($existingContainer) {
        Write-Host "Deteniendo contenedor existente..." -ForegroundColor Yellow
        docker stop $ContainerName | Out-Null
        docker rm $ContainerName | Out-Null
    }
    
    docker run -d --name $ContainerName -p "${Port}:3000" --restart unless-stopped "${ImageName}:latest"
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Contenedor iniciado en puerto $Port" -ForegroundColor Green
        Write-Host "Aplicacion disponible en: http://localhost:$Port" -ForegroundColor Green
    } else {
        Write-Host "Error al iniciar el contenedor" -ForegroundColor Red
    }
}

function Stop-Container {
    Write-Host "Deteniendo contenedor..." -ForegroundColor Blue
    $runningContainer = docker ps -q -f name=$ContainerName
    if ($runningContainer) {
        docker stop $ContainerName | Out-Null
        docker rm $ContainerName | Out-Null
        Write-Host "Contenedor detenido" -ForegroundColor Green
    } else {
        Write-Host "El contenedor no está ejecutándose" -ForegroundColor Yellow
    }
}


try {
    docker --version | Out-Null
} catch {
    Write-Host "Docker no está instalado o no está en el PATH" -ForegroundColor Red
    exit 1
}

switch ($Command.ToLower()) {
    "build" { Build-Image }
    "run" { Start-Container }
    "stop" { Stop-Container }
    default { Show-Help }
}
