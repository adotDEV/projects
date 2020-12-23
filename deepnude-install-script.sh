#!/bin/bash

# Installing dependencies

clear
echo "Do you want install DeepNude dependencies? [Y/n]"
read insdep
clear

if [ $insdep == y ] || [ $insdep == Y ]; then

    sudo apt update

    sudo apt install git

    git clone https://github.com/Homebrew/brew ~/.linuxbrew/Homebrew
    mkdir ~/.linuxbrew/bin
    ln -s ~/.linuxbrew/Homebrew/bin/brew ~/.linuxbrew/bin
    eval $(~/.linuxbrew/bin/brew shellenv)

brew install xz

fi

# Installing Python and PiP

clear
echo "Do you want install Python and PiP? [Y/n]"
read insPython
clear

if [ $insPython == y ] || [ $insPython == Y ];

then 
sudo wget -P /tmp https://www.python.org/ftp/python/3.9.1/Python-3.9.1.tar.xz
sudo tar -xf Python-3.9.1.tar.xz
sudo rm -rf Python-3.9.1.tar.xz
sudo /tmp/Python-3.9.1/configure
sudo rm -rf /tmp/Python-3.9.1/

sudo apt-get install python3-pip

fi

# Installing DeepNude

cd ~/Documents # <----- Change this to change DeepNude local installation.

pip3 install opencv_python numpy pillow setuptools six wheel 
pip3 install torch==1.7.0+cpu torchvision==0.8.1+cpu -f https://download.pytorch.org/whl/torch_stable.html

git clone https://github.com/zhengyima/DeepNude_NoWatermark_withModel.git
mv ./DeepNude_NoWatermark_withModel ./deepnude
clear

# Installing models

clear
echo "Do you want install models? [Y/n]"
read insMod
clear

if [ $insMod == y ] || [ $insMod == Y ]; then 

    mkdir ./deepnude/checkpoints
    cd ./deepnude/checkpoints
    
    wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1thVk_WAVcI8PoOAknvBBG51xufTGTPci' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1thVk_WAVcI8PoOAknvBBG51xufTGTPci" -O cm.lib && rm -rf /tmp/cookies.txt
    wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1OSEicdAAGrIBb7678RMGPmhuzdo8Yiql' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1OSEicdAAGrIBb7678RMGPmhuzdo8Yiql" -O mm.lib && rm -rf /tmp/cookies.txt
    wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1U98chaSdY9LH754t2jzPRmr_OowD2hRO' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1U98chaSdY9LH754t2jzPRmr_OowD2hRO" -O mn.lib && rm -rf /tmp/cookies.txt
    cd -

fi

# Deactivating self.gpu_ids

echo "Do you want disable self.gpu_ids? [Y/n]"
read disGpu
clear

if [ $disGpu == y ] || [ $disGpu == Y ]; then
    sed -i '64s/.*/		self.gpu_ids = [] #FIX CPU/' ./deepnude/gan.py
fi

clear

echo "code by adotDEV"
echo "please visit https://github.com/adotdev/"

