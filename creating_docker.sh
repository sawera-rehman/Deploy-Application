#!/bin/bash
touch Dockerfile
echo 'FROM python:3'>Dockerfile
echo 'RUN pip3 install django'>>Dockerfile
echo 'COPY . .'>>Dockerfile
echo 'RUN python manage.py migrate'>>Dockerfile
echo 'CMD ["python", "manage.py", "runserver", "0.0.0.0:80001"]'>>Dockerfile
docker build -t deploy-app .
docker run -p 8001:8001 deploy-app
echo "Docker is running..."
