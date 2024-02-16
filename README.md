# lamp docker

> Proyecto ASIR


## Cómo poner a funcionar esto

Clonamos el repositorio

```bash
git clone https://github.com/pabloqpacin/lamp_docker $HOME/PROYECTO
```

Entramos al repo local y arrancamos docker compose

```bash
cd $HOME/PROYECTO
docker compose up -d
```

Vemos nuestro sitio web

```bash
xdg-open http://localhost:8080
```

Estos son algunos comandos útiles

```bash
docker ps
docker compose logs -f

docker inspect proyecto-www-1 proyecto-db-1 | less
docker network ls
docker network inspect proyecto_default     # | jq -C | bat

docker compose down
```