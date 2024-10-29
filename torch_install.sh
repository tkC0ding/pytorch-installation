#!/bin/bash

conda create --name tf python=3.9.18

source activate base

conda activate tf

echo $CONDA_DEFAULT_ENV

nvidia-smi

. /etc/os-release
NAME=$(uname -s)
VERSION=$(lsb_release -rs)

cd ~

if [ "$NAME" == "Linux" ]; then
    if [ "$VERSION" == "20.04" ]; then
        wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
        sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
        wget https://developer.download.nvidia.com/compute/cuda/12.4.0/local_installers/cuda-repo-ubuntu2004-12-4-local_12.4.0-550.54.14-1_amd64.deb
        sudo dpkg -i cuda-repo-ubuntu2004-12-4-local_12.4.0-550.54.14-1_amd64.deb
        sudo cp /var/cuda-repo-ubuntu2004-12-4-local/cuda-*-keyring.gpg /usr/share/keyrings/
        sudo dpkg -i cuda-repo-ubuntu2004-12-4-local_12.4.0-550.54.14-1_amd64.deb
        sudo apt-get update
        sudo apt-get -y install cuda-toolkit-12-4

        wget https://developer.download.nvidia.com/compute/cudnn/9.2.1/local_installers/cudnn-local-repo-ubuntu2004-9.2.1_1.0-1_amd64.deb
        sudo dpkg -i cudnn-local-repo-ubuntu2004-9.2.1_1.0-1_amd64.deb
        sudo cp /var/cudnn-local-repo-ubuntu2004-9.2.1/cudnn-*-keyring.gpg /usr/share/keyrings/
        sudo dpkg -i cudnn-local-repo-ubuntu2004-9.2.1_1.0-1_amd64.deb
        sudo apt-get update
        sudo apt-get -y install cudnn
    elif [ "$VERSION" == "22.04" ]; then
        wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
        sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
        wget https://developer.download.nvidia.com/compute/cuda/12.4.0/local_installers/cuda-repo-ubuntu2204-12-4-local_12.4.0-550.54.14-1_amd64.deb
        sudo dpkg -i cuda-repo-ubuntu2204-12-4-local_12.4.0-550.54.14-1_amd64.deb
        sudo cp /var/cuda-repo-ubuntu2204-12-4-local/cuda-*-keyring.gpg /usr/share/keyrings/
        sudo dpkg -i cuda-repo-ubuntu2204-12-4-local_12.4.0-550.54.14-1_amd64.deb
        sudo apt-get update
        sudo apt-get -y install cuda-toolkit-12-4

        wget https://developer.download.nvidia.com/compute/cudnn/9.2.1/local_installers/cudnn-local-repo-ubuntu2204-9.2.1_1.0-1_amd64.deb
        sudo dpkg -i cudnn-local-repo-ubuntu2204-9.2.1_1.0-1_amd64.deb
        sudo cp /var/cudnn-local-repo-ubuntu2204-9.2.1/cudnn-*-keyring.gpg /usr/share/keyrings/
        sudo dpkg -i cudnn-local-repo-ubuntu2204-9.2.1_1.0-1_amd64.deb
        sudo apt-get update
        sudo apt-get -y install cudnn
    else
        echo "OS version not compatible."
    fi
else
    echo "Install ubuntu"
fi

conda install pytorch torchvision torchaudio pytorch-cuda=12.4 -c pytorch -c nvidia