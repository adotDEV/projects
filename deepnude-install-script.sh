#!/bin/bash
# Installing Python and PiP

clear
echo "Would you like to install Python's dependencies and Pip?? [Y/n]"
read insPython
clear

if [ $insPython == y ] || [ $insPython == Y ]; then 
    mkdir tempPy
    cd tempPy
    
    sudo apt update
    sudo apt install build-essential zlib1g-dev libjpeg-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev sqlite3 liblzma-dev curl libbz2-dev
    
    wget https://www.python.org/ftp/python/3.9.1/Python-3.9.1.tar.xz
    tar -xf ./Python-3.9.1.tar.xz
    cd Python-3.9.1
    ./configure --with-ensurepip=install

    sudo make -j 2 && sudo make altinstall
    python3.9 -m pip install --upgrade pip
    
    cd ../..
    sudo rm -rf ./tempPy
fi

# Installing DeepNude

cd ~/Documents # <----- Change this to change DeepNude local installation.
    
sudo apt install git
pip3.9 install opencv_python numpy pillow setuptools six wheel torch torchvision

git clone https://github.com/zhengyima/DeepNude_NoWatermark_withModel.git
mv ./DeepNude_NoWatermark_withModel ./deepnude
clear

# Installing models

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
    clear
fi

# Deactivating self.gpu_ids

echo "Do you want disable self.gpu_ids? [Y/n]"
read disGpu
clear

if [ $disGpu == y ] || [ $disGpu == Y ]; then
    sed -i '64s/.*/		self.gpu_ids = [] #FIX CPU/' ./deepnude/gan.py
    clear
fi

echo "code by adotDEV"
echo "please visit https://github.com/adotdev/"
