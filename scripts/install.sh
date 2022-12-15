#!/bin/bash
source colors.sh

clear

printf "${CYAN}¿Deseas actualizar el sistema e instalar los paquetes de uso básicos?${DEFAULT} ${GREEN}s${DEFAULT}/${RED}n${DEFAULT}\nrespuesta: "
read "response"

if [ "$response" = "s" ] || [ "$response" = "S" ] || [ "$response" = "y" ] || [ "$response" = "Y" ]
then
	source ./src/update_and_upgrade.sh
	source ./src/basic-packages.sh
	source ./src/snap-packages.sh
	source ./src/neovim.sh
	source ./src/google-chrome.sh
	source ./src/visual-studio-code.sh
	source ./src/docker-engine.sh
else
	printf "${RED}Decidiste cancelar la instalación de los paquetes de uso básicos...${DEFAULT}\n\n"
fi

printf "\n\n${GREEN}Script finalizado${DEFAULT}\n\n"

