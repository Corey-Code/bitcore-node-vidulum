#!/bin/bash

# install needed dependencies
sudo apt-get update
sudo apt-get install \
      build-essential pkg-config libc6-dev m4 g++-multilib \
      autoconf libtool ncurses-dev unzip git python python-zmq \
      zlib1g-dev wget curl bsdmainutils automake

# vidulumBitcore
cd
wget https://github.com/vidulum/vidulum/releases/download/v2.0.2/VDL-Linux.zip
unzip VDL-Linux.zip -d vidulum

if [ -d ~/.vidulum-params ]; then
echo "Params directory already exists"
else
mkdir .vidulum-params
fi

if [ -e ~/.vidulum-params/sprout-proving.key ]; then
echo "Proving key already present"
else
wget -O .vidulum-params/sprout-proving.key https://github.com/vidulum/sapling-params/releases/download/sapling/sprout-proving.key
fi

if [ -e ~/.vidulum-params/sprout-verifying.key ]; then
echo "Verifying key already present"
else
wget -O .vidulum-params/sprout-verifying.key https://github.com/vidulum/sapling-params/releases/download/sapling/sprout-verifying.key
fi

if [ -e ~/.vidulum-params/sprout-groth16.params ]; then
echo "Groth 16 Sapling params already present"
else
wget -O .vidulum-params/sprout-groth16.params https://github.com/vidulum/sapling-params/releases/download/sapling/sprout-groth16.params
fi

if [ -e ~/.vidulum-params/sapling-spend.params ]; then
echo "Sapling-spend params already present"
else
wget -O .vidulum-params/sapling-spend.params https://github.com/vidulum/sapling-params/releases/download/sapling/sapling-spend.params
fi

if [ -e ~/.vidulum-params/sapling-output.params ]; then
echo "Sapling-output params already present"
else
wget -O .vidulum-params/sapling-output.params https://github.com/vidulum/sapling-params/releases/download/sapling/sapling-output.params
fi

echo "Vidulumd with extended RPC functionalities is prepared. Please run following command to install insight explorer for Vidulum"
echo "wget -qO- https://raw.githubusercontent.com/Corey-Code/bitcore-node-vidulum/master/installExplorer.sh | bash"