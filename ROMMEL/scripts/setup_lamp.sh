#!/bin/bash

# Definición de variables
MYSQL_VERSION="8.0"
PHP_VERSION="7.4"
PROJECT_DIR="/var/www/proyecto"

# Descargar e instalar Docker
if ! command -v docker &> /dev/null; then
  echo "Instalando Docker..."
  curl -fsSL https://get.docker.com | sh
  sudo systemctl enable docker
  sudo systemctl start docker
fi

# Crear red Docker
docker network create lamp-network

# Iniciar servicio MySQL
docker run --rm --name mysql -e MYSQL_ROOT_PASSWORD="root" \
  -v mysql-data:/var/lib/mysql \
  -p 3306:3306 \
  mysql:${MYSQL_VERSION}

# Iniciar servicio Apache
docker run --rm --name apache -v ${PROJECT_DIR}:/var/www/html \
  -p 80:80 \
  -p 443:443 \
  -v /etc/ssl/apache:/etc/ssl/apache:ro \
  httpd:${PHP_VERSION}-apache

# Instalar PHP y extensiones
docker run --rm --name php -v ${PROJECT_DIR}:/var/www/html \
  -p 9000:9000 \
  -w /var/www/html \
  php:${PHP_VERSION}-fpm \
  apt-get update && apt-get install -y \
    php-cli \
    php-fpm \
    php-zip \
    php-gd \
    php-mysql \
    php-xml

# Configurar Apache
echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Crear archivo de configuración PHP
echo "<?php

// Configuración de la base de datos
define('DB_HOST', 'mysql');
define('DB_USER', 'root');
define('DB_PASSWORD', 'root');
define('DB_NAME', 'proyectodb');

// Otras configuraciones

?>" > ${PROJECT_DIR}/config.php

# Crear base de datos
docker exec -it mysql mysql -u root -p"root" \
  -e "CREATE DATABASE proyectodb;"

# Importar datos de ejemplo (opcional)
if [ -f "${PROJECT_DIR}/dump.sql" ]; then
  docker exec -it mysql mysql -u root -p"root" proyectodb < ${PROJECT_DIR}/dump.sql
fi

# Iniciar servicios
docker start mysql
docker start apache
docker start php

# Mostrar información de acceso
echo "**Acceso a la aplicación:**"
echo " - URL: http://localhost"
echo " - Usuario MySQL: root"
echo " - Contraseña MySQL: root"

echo "**Acceso a PHPMyAdmin:**"
echo " - URL: http://localhost/phpmyadmin"
echo " - Usuario MySQL: root"
echo " - Contraseña MySQL: root"

echo "**Para acceder a la aplicación desde el navegador, edite el archivo config.php en ${PROJECT_DIR} y configure la URL de la base de datos.**"

