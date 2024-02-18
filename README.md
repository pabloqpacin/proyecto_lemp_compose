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
git clone -b HelpDeskCore https://github.com/pabloqpacin/lamp_docker $HOME/PROYECTO
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

docker compose down
```