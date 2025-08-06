Write-Host "1. Verificando Docker..."
docker info | Out-Null
if ($LASTEXITCODE -ne 0) {
    Write-Host "Docker no esta disponible. Instalalo o inicialo."
    exit 1
}
Write-Host "Docker esta instalado y ejecutandose"

Write-Host "2. Limpiando recursos..."
docker rm -f "devops-app-container" 2>$null | Out-Null
docker rmi -f "devops-evaluation-app"     2>$null | Out-Null
Write-Host "Recursos previos eliminados"

Write-Host "3. Construyendo imagen..."
docker build -t "devops-evaluation-app" .
if ($LASTEXITCODE -ne 0) {
    Write-Host "Error construyendo imagen"
    exit 1
}
Write-Host "Imagen construida: "devops-evaluation-app""

Write-Host "4. Iniciando contenedor..."
$containerId = docker run -d -p "8080`:8080" -e "PORT=8080" -e "NODE_ENV=production" --name "devops-app-container" "devops-evaluation-app"
if ($LASTEXITCODE -ne 0) {
    Write-Host "Error iniciando contenedor"
    exit 1
}
Write-Host "Contenedor iniciado (ID: $containerId)"

Start-Sleep -Seconds 5

Write-Host "5. Verificando servicio..."
try {
    $response = Invoke-WebRequest -Uri "http://localhost:8080" -TimeoutSec 5 -ErrorAction Stop
    $status = $response.StatusCode
} catch {
    $status = 0
}

if ($status -eq 200) {
    Write-Host "Contenedor: "devops-app-container""
    Write-Host "Enlace: http://localhost:8080"
    Write-Host "Variables: PORT=8080, NODE_ENV=production"
} else {
    Write-Host "El servicio no responde (HTTP $status). Revisa logs:"
    docker logs "devops-app-container"
}
