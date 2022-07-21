#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m' # No Color

printf "${GREEN}INSTALLING DOCKER${NC} \n"

function usageHelp () {
	cat << EOF
 ***********************   USAGE   ***********************

                  Enter your sudo password
               (If you run only this script)

 *********************************************************
EOF
}



usageHelp

printf "${GREEN}UPDATE REPOSITORIES AND INSTALL DEPENDENCIES${NC} \n"
sudo dnf update -y 

sudo dnf -y install dnf-plugins-core

sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo


printf "${GREEN}DOCKER INSTALL${NC} \n"
sudo dnf install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
sudo usermod -aG docker $USER -y

printf "${GREEN}SIMPLE CLEANUP${NC} \n"
sudo dnf autoremove -y