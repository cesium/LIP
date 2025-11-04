#!/bin/bash

set -e

sudo() { echo "$PASSWORD" | command sudo -S true && command sudo "$@"; }


case "$(basename "$SHELL")" in
    zsh)
        BASESHELL="zsh"
        SHFILE="$HOME/.zshrc"
        ;;
    bash)
        BASESHELL="bash"
        SHFILE="$HOME/.bashrc"
        ;;
    fish)
        BASESHELL="fish"
        SHFILE="$HOME/.config/fish/config.fish"
        ;;
    *)
        BASESHELL=""
        SHFILE="$HOME/.profile"
        ;;
esac

read -r -s -p "[sudo] password for $LOGNAME: " PASSWORD

if command -v apt &>/dev/null; then

    sudo apt update -y
    sudo apt upgrade -y

    pkgs=(
        build-essential
        git
        curl
        wget
    )

    sudo apt install -y "${pkgs[@]}"

    curl https://mise.run | sh

    if [[ "$BASESHELL" == "zsh" || "$BASESHELL" == "bash" ]]; then
        echo "eval \"\$(~/.local/bin/mise activate $BASESHELL)\"" >> "$SHFILE"
    elif [[ "$BASESHELL" == "fish" ]]; then
        echo '~/.local/bin/mise activate fish | source' >> "$HOME/.config/fish/config.fish"
    fi

    for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

    # Add Docker's official GPG key:
    sudo apt-get update
    sudo apt-get install ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Add the repository to Apt sources:
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update

    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    echo "Docker installed"

elif command -v pacman &>/dev/null; then
    pkgs=(
        base-devel
        git
        curl
        wget
    )
    # update system
    sudo pacman -Syyu --noconfirm --needed "${pkgs[@]}"

    curl https://mise.run | sh

    if [[ "$BASESHELL" == "zsh" || "$BASESHELL" == "bash" ]]; then
        echo "eval \"\$(~/.local/bin/mise activate $BASESHELL)\"" >> "$SHFILE"
    elif [[ "$BASESHELL" == "fish" ]]; then
        echo '~/.local/bin/mise activate fish | source' >> "$HOME/.config/fish/config.fish"
    fi

    sudo pacman -S docker
    
    sudo systemctl start docker.service
    sudo systemctl enable docker.service
    sudo usermod -aG docker $USER
    newgrp docker

elif command -v dnf &>/dev/null; then

    pkgs=(
        git
        curl
        wget
    )

    sudo dnf install -y "${pkgs[@]}"

    curl https://mise.run | sh

    if [[ "$BASESHELL" == "zsh" || "$BASESHELL" == "bash" ]]; then
        echo "eval \"\$(~/.local/bin/mise activate $BASESHELL)\"" >> "$SHFILE"
    elif [[ "$BASESHELL" == "fish" ]]; then
        echo '~/.local/bin/mise activate fish | source' >> "$HOME/.config/fish/config.fish"
    fi

    sudo dnf -y install dnf-plugins-core
    sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
    
    sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    sudo systemctl enable --now docker

elif [[ "$OSTYPE" == "darwin"* ]]; then
    
    if ! command -v brew &>/dev/null; then
            echo "Installing Homebrew..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    brew update
    brew install git curl wget

    curl https://mise.run | sh

    if [[ "$BASESHELL" == "zsh" || "$BASESHELL" == "bash" ]]; then
        echo "eval \"\$(~/.local/bin/mise activate $BASESHELL)\"" >> "$SHFILE"
    elif [[ "$BASESHELL" == "fish" ]]; then
        echo '~/.local/bin/mise activate fish | source' >> ~/.config/fish/config.fish
    fi
fi
