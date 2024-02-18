#!/bin/bash

# Actualizar el sistema
sudo apt update

# Instalar Docker
sudo apt install docker.io

# Instalar Docker Compose
sudo apt install docker-compose

# Crear un directorio para el proyecto
mkdir mi_proyecto
cd mi_proyecto

# Crear el archivo Dockerfile para PHP
cat << EOF > Dockerfile-php
FROM php:7.4-fpm

RUN apt-get update && apt-get install -y \
    curl \
    git

COPY . /app

WORKDIR /app

CMD ["php-fpm"]
EOF

# Crear el archivo Dockerfile para MySQL
cat << EOF > Dockerfile-mysql
FROM mysql:5.7

ENV MYSQL_ROOT_PASSWORD root

RUN echo "CREATE DATABASE mi_db;" | mysql -u root -p$MYSQL_ROOT_PASSWORD
EOF

# Crear el archivo docker-compose.yml
cat << EOF > docker-compose.yml
version: '3'

services:
  php:
    build:
      context: .
      dockerfile: Dockerfile-php
    volumes:
      - ./app:/var/www/html
    ports:
      - "80:80"
    depends_on:
      - mysql
  mysql:
    build:
      context: .
      dockerfile: Dockerfile-mysql
    environment:
      MYSQL_ROOT_PASSWORD: "tu_contraseña_segura"
    ports:
      - "3306:3306"
    volumes:
      - mysql-data:/var/lib/mysql

volumes:
  mysql-data:

EOF

# Iniciar los contenedores
docker-compose up -d

# Comprobar la instalación
echo "**Comprobando la instalación:**"

docker ps

echo "**Acceder a la aplicación:**"

echo "Abra un navegador web y acceda a http://localhost:9000."

echo "**Desarrollar la aplicación:**"

echo "Puede usar el directorio mi_proyecto para desarrollar su aplicación web."

echo "Los archivos PHP se ejecutarán en el contenedor php."

echo "La base de datos MySQL estará disponible en el contenedor mysql."

echo "**Recursos adicionales:**"

echo "* https://docs.docker.com/get-started/"

echo "* https://docs.docker.com/compose/"

echo "* https://www.php.net/"

echo "* https://dev.mysql.com/"

echo "**Consejos:**"

echo "* Use nombres descriptivos para sus archivos y directorios."

echo "* Use un editor de código con resaltado de sintaxis y autocompletado."

echo "* Pruebe su aplicación con frecuencia para detectar errores."

echo "* Use el control de versiones para realizar un seguimiento de los cambios en su código."
