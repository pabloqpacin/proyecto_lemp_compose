#!/usr/bin/env bash

# # En los LXC...
# bash -c "$(https://github.com/pabloqpacin/lamp_docker/scripts/lxc-base.sh)"
# - Ejecutado como root!!
# - Se recomiendan 8GB de Almacenamiento para el LXC: tanto debian como ubuntu (+ docker)


apt_install(){
    if [ ! -e "/etc/apt/apt.conf.d/99show-versions" ]; then
        echo 'APT::Get::Show-Versions "true";' > /etc/apt/apt.conf.d/99show-versions
    fi

    apt update && apt upgrade -y && apt autoremove -y && apt autoclean

    apt install -y bat fzf grc git jq lf mycli nmap tmux tree vim
    apt install -y --no-install-recommends neofetch

    if ! command -v bat && command -v batcat; then
        mv $(which batcat) /usr/bin/bat
    fi

    read -p "Install tldr [y/N]? " opt_tldr
    if [[ $opt_tldr == 'y' ]]; then
        apt install tldr
        if [ ! -d ~/.local/share ]; then
            mkdir ~/.local/share
        fi
        tldr --update
    fi
}

check_disk(){
    disk_usage=$(df -h | grep '/$' | grep % | awk '{print $5}' | tr -d '%')
    if [[ $disk_usage > 50 ]]; then
        echo "Disk is $disk_usage% full, watch out"
    fi
}

clone_dotfiles() {
    if [ ! -d ~/dotfiles ]; then
        git clone --depth 1 https://github.com/pabloqpacin/dotfiles ~/dotfiles
    fi
    if [ ! -d ~/.config ]; then
        mkdir ~/.config &>/dev/null
    fi
    if [ ! -L ~/.myclirc ]; then
        ln -s ~/dotfiles/.myclirc ~/
    fi
    if [ ! -L ~/.config/lf ]; then
        ln -s ~/dotfiles/.config/lf ~/.config
    fi
    if [ ! -L ~/.config/bat ]; then
        ln -s ~/dotfiles/.config/bat ~/.config
        sed -i 's/OneHalfDark/Coldark-Dark/' ~/.config/bat/config
    fi
    if [ ! -L ~/.vimrc ]; then
        if [ -e ~/.vimrc ]; then mv ~/.vimrc{,.bak}; fi
        sed -i 's/nvim/vim/g' ~/dotfiles/.zshrc
        ln -s ~/dotfiles/.vimrc ~/
    fi
    # if [ ! -L ~/.config/tmux ]; then
    #     ln -s ~/dotfiles/.config/tmux ~/.config       # Problemas para seleccionar/copiar texto
    # fi
}

setup_zsh(){
    apt update && apt install -y zsh

    if [ ! -d ~/.oh-my-zsh ]; then
        yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        bash $HOME/dotfiles/scripts/setup/omz-msg_random_theme.sh
    fi
    
    chsh -s $(which zsh) $USER
    
    if [ ! -L ~/.zshrc ]; then
        mv ~/.zshrc{,.bak} &&
        ln -s ~/dotfiles/.zshrc ~/
    fi
    
    if [[! -d ~/dotfiles/zsh/plugins/zsh-autosuggestions || ! -d ~/dotfiles/zsh/plugins/zsh-syntax-highlighting ]]; then
        bash $HOME/dotfiles/zsh/plugins/clone-em.sh
    fi
}

# setup_docker(){
#     sh <(curl -sSL https://get.docker.com)
# }


start_compose(){
    if [ ! -d $HOME/PROYECTO ]; then
        git clone https://github.com/pabloqpacin/lamp_docker $HOME/PROYECTO
    fi

    if ! docker ps -a --format '{{.Names}}' | grep -q 'proyecto'; then
        cd $HOME/PROYECTO
        docker compose up -d
        cd $HOME
    fi
}


# ---

if true; then
    apt_install
    clone_dotfiles

    opt_zsh=''
    while [[ $opt_zsh != 'y' && $opt_zsh != 'n' ]]; do
        read -p "Establecer zsh [y/n]? " opt_zsh
    done
    if [[ $opt_zsh == 'y' ]]; then
        setup_zsh
    fi

    start_compose
fi

echo "" && neofetch && grc docker ps -a && echo -e "\nReinicia el contenedor.\n"



