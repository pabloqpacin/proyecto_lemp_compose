# lamp docker

> Proyecto ASIR


## Cómo poner a funcionar esto

### a) Con scripts

1. En Proxmox, creamos el contenedor LXC

```bash
# Docker LXC (default)
bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/ct/docker.sh)"
  # Añadir Portainer: no
  # Añadir Docker Compose: sí
```

2. En el contenedor LXC, configuramos el entorno y desplegamos la aplicación web

```bash
bash -c "$(curl -fsSL https://github.com/pabloqpacin/lamp_docker/raw/main/scripts/lxc-base.sh)"
```

<!-- 3. Mantenimiento

```bash
dps
dvls
``` -->

<br>
<hr>


### b) Sin scripts

> WIP

Instalamos dependencias (en Ubuntu 22.04 y distros derivadas):

<!-- Raspberry Pi -->

<details>

> Esto lo automatizaremos con scripts

```bash
# Instalamos docker -- https://docs.docker.com/engine/install/ubuntu/
    # Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Instalamos otras dependencias
sudo apt-get install git    # grc jq mycli
```

</details>


Clonamos el repositorio:

```bash
git clone https://github.com/pabloqpacin/lamp_docker $HOME/PROYECTO
```

Entramos al repo local y arrancamos docker compose:

```bash
cd $HOME/PROYECTO
docker compose up -d
```

Verificamos conexión a la base de datos con `phpmyadmin` en el navegador o con `mycli` en la terminal:

```bash
# phpmyadmin
xdg-open http://localhost:8080

# mycli
mycli -u root -ppassword -D helpdesk_core_php
```

Visitamos la [webapp](https://www.synchlabcoding.com/2023/06/helpdesk-system-with-jquery-php-mysql.html) y nos logueamos:

```bash
xdg-open http://localhost:80

# Username: johndoe@helpdesk.com
# Password: password

# ...
```


Algunos comandos útiles:

```bash
docker ps
docker compose logs -f

docker inspect proyecto-www-1 proyecto-db-1 # | less
docker volume ls
docker network ls
docker network inspect proyecto_default     # | jq -C | bat

docker compose down -v
```
