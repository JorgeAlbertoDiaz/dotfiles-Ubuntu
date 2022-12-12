#!/bin/bash

printf "${GREEN}Actualizando la lista de paquetes disponibles en el repositorio.${DEFAULT}\n"
printf "Ejecuta apt update...\n\n"
sudo apt update

printf "\n\n${CYAN}La siguiente es la lista de paquetes que se van a actualizar.${DEFAULT}\n"
apt list --upgradable

printf "\n\n${GREEN}Instalar actualizaciones de los paquetes del sistema.${DEFAULT}\n"
printf "Ejecuta apt upgrade...\n\n"
sudo apt upgrade -y

printf "${GREEN}Ahora se procederá con la instalación de los paquetes básicos.${DEFAULT}\n\n"
printf "Ejecuta apt upgrade...\n\n"
source ./install/install-packages.sh


