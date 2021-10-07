#!/bin/bash

set -e

sudo() { echo "$PASSWORD" | command sudo -S true && command sudo "$@"; }

read -r -s -p "[sudo] password for $LOGNAME: " PASSWORD

if command -v apt &>/dev/null; then
    # update system
    sudo apt update -y
    sudo apt upgrade -y

    pkgs=(
        haskell-platform # install haskell
        git # install verion control
        curl # install curl
        wget
        neovim
    )

    sudo apt install -y "${pkgs[@]}"

    # install vscode
    curl https://packages.microsoft.com/keys/microsoft.asc |
        gpg --dearmor > microsoft.gpg
    sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" |
        sudo tee /etc/apt/sources.list.d/vscode.list

    sudo apt install apt-transport-https
    sudo apt update
    sudo apt install code -y # or code-insiders

    wget -P /tmp -O discord.deb 'https://discord.com/api/download?platform=linux&format=deb' #Install discord
    sudo apt install -y /tmp/discord.deb

    # set vscode as the default editor (https://wiki.debian.org/DebianAlternative)
    sudo update-alternatives --set editor /usr/bin/code
elif command -v apt &>/dev/null; then
    pkgs=(
        stack # install haskell
        firefox # install firefox
        git # install version control
        code # install vscode
        discord # install discord
        curl
        wget
        neovim
    )
    # update system
    sudo pacman -Syyu --noconfirm --needed "${pkgs[@]}"
else
    pkgs=(
        haskell-platform # install haskell
        git # install verion control
        curl # install curl
        wget
        discord
        code
        neovim
    )
    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
    sudo dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm # Enable rpmfusion repos
    sudo yum -y update
    sudo yum -y install "${pkgs[@]}"

fi

# install Haskell Syntax Highlighting extension
code --install-extension justusadam.language-haskell
