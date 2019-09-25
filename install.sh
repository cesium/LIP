#!/bin/bash

if hash apt 2>/dev/null; then
    # update system
    sudo apt update
    sudo apt upgrade
    
    # install haskell
    sudo apt install haskell-platform -yqq
    
    # install chromium browser
    sudo apt install chromium-browser -yqq
    
    # install verion controll (svn and git)
    sudo apt install subversion git -yqq
    
    # install curl
    sudo apt install curl -yqq

    # install vscode
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
    sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
    
    sudo apt install apt-transport-https
    sudo apt update
    sudo apt install code -yqq # or code-insiders

    # set vscode as the default editor (https://wiki.debian.org/DebianAlternative)
    sudo update-alternatives --set editor /usr/bin/code

else
    # update system
    sudo pacman -Syyu
    
    # install haskell
    sudo pacman -S stack
    
    # install chromium browser
    sudo pacman -S chromium
    
    # install verion controll (svn and git)
    sudo pacman -S subversion git
    
    # install curl
    sudo pacman -S curl

    #install vscode
    sudo pacman -S code
fi

# install Haskell Syntax Highlighting extension
sudo code --install-extension justusadam.language-haskell
