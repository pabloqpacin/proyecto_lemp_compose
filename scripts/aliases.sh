# https://github.com/pabloqpacin/dotfiles/blob/main/zsh/aliases.zsh

if command -v grc &>/dev/null; then
    alias docker="grc docker"
fi

alias dps='docker ps'
alias dils='docker image ls'
alias dvls='docker volume ls'
alias dnls='docker network ls'

alias dlf='docker logs -f'
alias drmv='docker rm -v'

docker-inspect() {
    docker inspect "$1" | jq -C
}

docker-inspect-p() {
    if command -v bat &>/dev/null; then
        docker inspect "$1" | jq -C | bat
    else
        docker inspect "$1" | jq -C | less
    fi
}

alias dcu='docker compose up'
alias dcd='docker compose down --rmi all -v'

alias dcps='docker compose ps'
alias dcls='docker compose ls'

docker-prune(){
    yes | docker network prune && \
    yes | docker volume prune && \
    yes | docker image prune && \
    yes | docker builder prune
}
