DOCKER_PATH=$(command -v docker)

#El flag -z en bash se usa para determinar cuando una cadena esta vacia

if [ -z "$DOCKER_PATH" ]; then
    echo "Docker no está instalado en este sistema."
    exit 1
else
    echo "Docker está instalado en: $DOCKER_PATH"
    docker --version

    docker-compose up --build

fi

