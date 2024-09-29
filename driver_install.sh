#!/bin/bash

sudo apt-get update
sudo apt-get upgrade

if command -v curl &> /dev/null; then
    curl -sL \"https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh" > \"Miniconda3.sh"
else
    sudo apt install curl -y
    curl -sL \"https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh" > \"Miniconda3.sh"
fi

bash Miniconda3.sh
source ~/.bashrc

conda create --name tf python=3.9.18

sudo ubuntu-drivers install nvidia:535
sudo reboot