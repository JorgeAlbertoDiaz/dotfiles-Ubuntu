#!/bin/bash
source colors.sh

clear

printf "${CYAN}¿Deseas actualizar el sistema e instalar los paquetes de uso básicos?${DEFAULT} ${GREEN}s${DEFAULT}/${RED}n${DEFAULT}\nrespuesta: "
read "response"

if [ "$response" = "s" ] || [ "$response" = "S" ] || [ "$response" = "y" ] || [ "$response" = "Y" ]
then
	source ./install/update_and_upgrade.sh
	source ./install/basic-packages.sh
	source ./install/google-chrome.sh
else
	printf "${RED}Decidiste cancelar la instalación de los paquetes de uso básicos...${DEFAULT}\n\n"
fi

printf "\n\n${GREEN}Script finalizado${DEFAULT}\n\n"

