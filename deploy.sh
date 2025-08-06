#!/bin/bash
IMAGE_NAME="devops-evaluation-app"
CONTAINER_NAME="devops-app"
PORT=8080
if ! command -v docker &> /dev/null; then
echo "ERROR: Docker not installed"
exit 1
fi
if ! sudo docker info &> /dev/null; then
echo "ERROR: Docker not running"
exit 1
fi
if sudo docker ps -a | grep -q $CONTAINER_NAME; then
echo "Stopping current container"
sudo docker stop $CONTAINER_NAME &> /dev/null
sudo docker rm $CONTAINER_NAME &> /dev/null
fi
if ! sudo docker build -t $IMAGE_NAME .; then
echo "ERROR: not image builded"
exit 1
fi
if ! sudo docker run -d \
--name $CONTAINER_NAME \
-p $PORT:3000 \
-e NODE_ENV=production \
$IMAGE_NAME; then
echo "ERROR: not running container"
exit 1
fi
sleep 10
for i in {1..10}; do
if curl -s http://localhost:$PORT > /dev/null; then
echo "Service on: http://localhost:$PORT"
break
fi
if [ $i -eq 10 ]; then
echo "ERROR: Server not responding!"
sudo docker logs $CONTAINER_NAME
exit 1
fi
sleep 2
done
echo "Status: $(sudo docker ps --format 'table {{.Status}}' | grep -v STATUS | head -1)"