if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
    Write-Host "[ERROR] Docker no está instalado." -ForegroundColor Red
    exit 1
}

docker build -t arquitectura-sfv-p1 .
if ($LASTEXITCODE -ne 0) {
    Write-Host "[ERROR] Falló la construcción de la imagen Docker." -ForegroundColor Red
    exit 1
}

docker rm -f arquitectura-sfv-p1-container > $null 2>&1

docker run -d --name arquitectura-sfv-p1-container -e PORT=8080 -e NODE_ENV=production -p 8080:8080 arquitectura-sfv-p1
if ($LASTEXITCODE -ne 0) {
    Write-Host "[ERROR] Falló al iniciar el contenedor." -ForegroundColor Red
    exit 1
}

Start-Sleep -Seconds 3

try {
    $response = Invoke-WebRequest -Uri http://localhost:8080/health -TimeoutSec 5 -ErrorAction Stop
    if ($response.StatusCode -eq 200 -and $response.Content -eq 'OK') {
        Write-Host "[OK] El endpoint /health responde correctamente." -ForegroundColor Green
        $success = $true
    } else {
        Write-Host "[ERROR] /health no respondió correctamente. Código: $($response.StatusCode), Respuesta: $($response.Content)" -ForegroundColor Red
        $success = $false
    }
} catch {
    Write-Host "[ERROR] No se pudo conectar al endpoint /health en el contenedor." -ForegroundColor Red
    $success = $false
}

if ($success) {
    Write-Host "Resumen: ÉXITO. La aplicación está corriendo en Docker en http://localhost:8080" -ForegroundColor Green
} else {
    Write-Host "Resumen: ERROR. Revisa los pasos anteriores." -ForegroundColor Red
}