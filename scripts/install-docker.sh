#!/bin/bash

function usageHelp () {
	cat << EOF
 ***********************   USAGE   ***********************
                  Enter your sudo password

 *********************************************************
EOF
}

GREEN='\033[0;32m'
NC='\033[0m' # No Color

usageHelp

printf "${GREEN}UPDATE AND INSTALL DEPENDENCIES${NC} \n"
sudo apt update -y && sudo apt upgrade -y
sudo apt install curl -y

printf "${GREEN}DOCKER INSTALL${NC} \n"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" -y
sudo apt update -y
sudo apt install docker-ce -y
sudo usermod -aG docker $USER

printf "${GREEN}SIMPLE CLEANUP${NC} \n"
sudo apt autoremove -y

