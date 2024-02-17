#!/bin/bash

update_system(){
    sudo pacman -Syu
}

install_docker(){
    sudo pacman -S docker docker-buildx docker-compose
    sudo usermod -aG docker $USER && newgrp docker                              # ojo en prod.
    sudo systemctl enable --now docker
}

install_dependencies(){
    sudo pacman -S git
}

install_base_packages(){
    sudo pacman -S grc jq   # neovim nmap tldr tmux zsh
    # yay -S mycli
}

config_base_system(){
    # basically clone them dotfiles, then install and symlink everything relevant...
}

deploy_project(){
    git clone --branch scripts_aliases https://github.com/pabloqpacin/lamp_docker.git $HOME/PROYECTO
    # git clone https://github.com/pabloqpacin/lamp_docker.git $HOME/PROYECTO
    cd $HOME/PROYECTO
    docker compose up -d
    sleep 10
    xdg-open http://localhost:80 &; disown
}


# ---

# if $true; then
#     update_system
#     install_docker
#     install_dependencies
#     install_base_packages
#     config_base_system
#     deploy_project
# fi
