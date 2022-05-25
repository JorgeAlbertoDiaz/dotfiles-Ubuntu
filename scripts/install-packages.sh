#!/bin/bash

clear

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
ENDCOLOR="\e[0m"

packageNames=(
"curl"
"figlet"
"fzf"
"git"
"lua5.2"
"mysql-server-8.0"
"neofetch"
"neovim"
"stow"
"tmux"
"vim"
)


VAR=""
PACKAGES=""
echo -e "Verificando paquetes instalados:\n"
for PACKAGE in ${packageNames[@]}; do
	dpkg -s $PACKAGE &> /dev/null

	if [ $? -ne 0 ]
		then
			echo -e "- ${PACKAGE} : ${RED}no instalado${ENDCOLOR}"
			VAR+="\n- ${PACKAGE}"
			PACKAGES+="${PACKAGE} "
		else
			echo -e "+ ${PACKAGE} : ${GREEN}instalado${ENDCOLOR}"
	fi
done
echo -e "\n"


INSTALL=""
if [[ $VAR ]]
	then
		echo -e "${GREEN}Se instalaran los siguientes paquetes:\n${VAR}\n${ENDCOLOR}"
		INSTALL=true
	else
		echo -e "${GREEN}esta todo instalado${ENDCOLOR}"
fi

if [[ $INSTALL ]]
	then
		sudo apt update && sudo apt install -y $PACKAGES
fi

echo -e "${GREEN}Script finalizado${ENDCOLOR}"
