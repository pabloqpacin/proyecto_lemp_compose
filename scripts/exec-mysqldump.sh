#!/usr/bin/env bash

# Entramos al contenedor & Creamos el dump de la BD en el volumen
docker exec -it proyecto-db-1 sh -c \
    "mysqldump -u root -ppassword helpdesk_core_php > /var/lib/mysql/$(date +%F).sql"

# Verificar en el host
sudo cp /var/lib/docker/volumes/proyecto_mysql_data/_data/$(date +%F).sql \
        /tmp/$(date +%F).sql

sudo chown $USER /tmp/$(date +%F).sql
# sudo chmod o+rwx /tmp/$(date +%F).sql
