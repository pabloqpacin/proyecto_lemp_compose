# lamp docker

> Proyecto ASIR


## Cómo poner a funcionar esto

Instalamos dependencias (en Ubuntu 22.04 y distros derivadas):

<!-- Raspberry Pi -->

<details>

> Esto lo automatizaremos con scripts

```bash
# Instalamos docker
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

Vemos nuestro sitio web y consultamos phpmyadmin:

```bash
xdg-open http://localhost:80
xdg-open http://localhost:8080

# DEMO TICKETARDOS: PHP MYSQL -- https://www.youtube.com/watch?v=zZ6vybT1HQs
  xdg-open http://localhost/select_user.php
  xdg-open http://localhost/add_user.php
  xdg-open http://localhost/form.php
  xdg-open http://localhost/select_user.php

# $ mycli -u root -ppassword -D db1
```

Algunos comandos útiles:

```bash
docker ps
docker compose logs -f

docker inspect proyecto-www-1 proyecto-db-1 # | less
docker network ls
docker network inspect proyecto_default     # | jq -C | bat

docker compose down
```