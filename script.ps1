$ImageName = "arquitecturasfv-p1"
$ContainerName = "arquitecturasfv-container"

Write-Host "Verificando si Docker está instalado..."
if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
    Write-Host "Docker no está instalado. Instálalo antes de continuar."
    exit 1
}

Write-Host "Construyendo la imagen..."
docker build -t $ImageName .

if ($LASTEXITCODE -ne 0) {
    Write-Host "Error en la construcción de la imagen."
    exit 1
}

Write-Host "Eliminando contenedor anterior si existe..."
docker rm -f $ContainerName | Out-Null

Write-Host "Ejecutando contenedor..."
docker run -d --name $ContainerName -p 8080:8080 -e PORT=8080 -e NODE_ENV=production $ImageName

Start-Sleep -Seconds 3
Write-Host "Verificando que el servicio responde..."

try {
    $response = Invoke-WebRequest -Uri "http://localhost:8080" -UseBasicParsing -TimeoutSec 5
    if ($response.StatusCode -eq 200) {
        Write-Host "Aplicación funcionando correctamente en http://localhost:8080"
    } else {
        Write-Host "La aplicación respondió con código: $($response.StatusCode)"
        exit 1
    }
}
catch {
    Write-Host "Error: la aplicación no responde."
    exit 1
}