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
        subversion git # install verion controll (svn and git)
        curl # install curl
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

    # set vscode as the default editor (https://wiki.debian.org/DebianAlternative)
    sudo update-alternatives --set editor /usr/bin/code
else
    pkgs=(
        stack # install haskell
        firefox # install firefox
        subversion git # install version controll
        code # install vscode
        discord # install discord
    )
    # update system
    sudo pacman -Syyu --noconfirm --needed "${pkgs[@]}"
fi

# install Haskell Syntax Highlighting extension
code --install-extension justusadam.language-haskell
