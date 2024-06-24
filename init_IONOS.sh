#!/bin/bash

#For Ubuntu

sudo apt-get update

sudo apt-get install elixir

sudo apt-get install git

# Permitir puertos especificados
sudo ufw allow 4000/tcp
sudo ufw allow 4369/tcp
sudo ufw allow 9100:9155/tcp
sudo ufw allow 4369/udp
sudo ufw allow 32768:65535/tcp
sudo ufw allow 32768:65535/udp

# Activar ufw
yes | sudo ufw enable

# Mostrar el estado de ufw
sudo ufw status

git clone https://github.com/drownlifex/SSE_with_elixir_libcluster.git

cd SSE_with_elixir_libcluster

ls