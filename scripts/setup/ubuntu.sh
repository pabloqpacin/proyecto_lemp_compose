#!/bin/bash

# https://github.com/pabloqpacin/ASIR/blob/main/PROYECTO/maquina-virtual.md
# https://github.com/pabloqpacin/dotfiles/tree/main/scripts/autosetup


actualizar_sistema(){

    # Hacer los mensajes de APT más verbose
    if [ ! -e "/etc/apt/apt.conf.d/99show-versions" ]; then
        echo 'APT::Get::Show-Versions "true";' | sudo tee /etc/apt/apt.conf.d/99show-versions
    fi

    # Actualizar el sistema
    sudo apt-get update && \
        sudo apt-get upgrade -y && \
        sudo apt-get autoremove -y && \
        sudo apt-get autoclean -y
}

instalar_paquetes_basicos(){

    # Consultar neofetch
    sudo apt-get install neofetch --no-install-recommends && neofetch

    # Instalar paquetes necesarios y recomendados
    sudo apt-get install -y \
        git grc jq mycli nmap tldr tmux zsh     # openssh-server code

    # # Configurar Git    
    # read -p "Introduce el email asociado a tu cuenta de Github (necesario para hacer commits): " $USER_EMAIL
    # git config --global user.name "$USER"
    # git config --global user.email "$USER_EMAIL"

    # Iniciar tldr (MAN majete)
    tldr --update && tldr tldr

    # # Instalar anydesk
    # flatpak update -y &&
    #     flatpak install anydesk
}


# Cambiar bash por zsh y aplicar https://ohmyz.sh y mi configuración para tener aliases, colores, etc
configurar_zsh(){
    sudo apt-get install -y zsh

    if [ ! -d ~/dotfiles ]; then
        git clone https://github.com/pabloqpacin/dotfiles $HOME/dotfiles
    fi

    if [ ! -d ~/.oh-my-zsh ]; then
        yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        bash $HOME/dotfiles/scripts/setup/omz-msg_random_theme.sh
    fi

    if [ ! -L ~/.zshrc ]; then
        mv ~/.zshrc{,.bak} &&
        ln -s ~/dotfiles/.zshrc ~/
    fi

    if [[! -d ~/dotfiles/zsh/plugins/zsh-autosuggestions || ! -d ~/dotfiles/zsh/plugins/zsh-syntax-highlighting ]]; then
        bash $HOME/dotfiles/zsh/plugins/clone-em.sh
    fi

}

instalar_neovim(){

    # Instalar neovim
    sudo apt-get update &&
        sudo apt-get install build-essential cmake gettext ninja-build unzip
    git clone --depth 1 https://github.com/neovim/neovim /tmp/neovim && \
        cd /tmp/neovim && make CMAKE_BUILD_TYPE=Release && \
        sudo make install

    # Aplicar .vimrc o .config/nvim

}

instalar_docker(){

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


    sudo systemctl enable --now docker

    # sudo usermod -aG docker $USER
}


# ===


# comprobaciones_iniciales(){
#     ARQ=$(uname --machine)
#     DISTRO=$(grep -s '^ID=' /etc/os-release | awk -F '=' '{print $2}')

#     case $DISTRO in
#         'pop'| 'ubuntu')    echo 'ubuntu' ;;
#         'arch')             echo 'archlinux' ;;
#         *)                  echo 'wtf' ;;
#     esac
# }

# comprobaciones_iniciales

# case $arch in
#     'x86_64')   echo "El sistema es '$arch'. Distro debe ser Ubuntu 22.04, Ubuntu 22.10, PopOS 22.04, etc." ;;
#     'aarch64')  echo "El sistema es '$arch'. El dispositivo debe ser una Raspberry Pi con Ubuntu 22.10." ;;
#     *)          echo wtf ;;
# esac

    # OJO diffs entre ubuntu y popos (alacritty, bat, etc etc)

# actualizar_sistema
# instalar_paquetes_basicos
# # configurar_zsh
# instalar_neovim
# instalar_docker

