# PASO 1
if (!(Get-Command docker -ErrorAction SilentlyContinue)) {
    Write-Host "Docker is not installed. Please install Docker and try again."
    exit 1
}
Write-Host "Docker is installed. Proceeding with the script..."

# stop and remove the container if it exists
docker stop app_container 
docker rm -f app_container

# PASO 2
Write-Host "Building Docker image..."
docker build -t app_image .

# PASO 3
Write-Host "Docker image built successfully."
docker run --name app_container -e PORT=8080 -e NODE_ENV=PRODUCTION -p 8080:8080 -d app_image

Start-Sleep -Seconds 1
try {
    # PASO 4
    $response = Invoke-WebRequest -Uri "http://localhost:8080" -UseBasicParsing
    Write-Host "GET request successful. Status code: $($response.StatusCode)"
    
    # PASO 5
    Write-Host "Response content:"
    Write-Host $response.Content
} catch {
    Write-Host "GET request failed: $($_.Exception.Message)"
}