#!/bin/bash

sudo apt-get update
sudo apt-get upgrade

if command -v wget > /dev/null 2>&1; then
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
    chmod +x Miniconda3-latest-Linux-x86_64.sh
    ./Miniconda3-latest-Linux-x86_64.sh
else
    sudo apt-get install -y wget
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
    chmod +x Miniconda3-latest-Linux-x86_64.sh
    ./Miniconda3-latest-Linux-x86_64.sh
fi

rm -r Miniconda3-latest-Linux-x86_64.sh

sudo ubuntu-drivers install nvidia:535
sudo reboot