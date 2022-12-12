#!/bin/bash

packageNames=(
	"curl"
	"fd-find"
	"ffmpegthumbnailer"
	"figlet"
	"fzf"
	"git"
	"libmysqlclient-dev"
	"libxext-dev"
	"lua5.2"
	"mysql-server-8.0"
	"neofetch"
	"screenfetch"
	"neovim"
	"poppler-utils"
	"ripgrep"
	"stow"
	"tmux"
	"vim"
	"wget"
	"xclip"
)


VAR=""
PACKAGES=""
echo -e "Verificando paquetes instalados:\n"
for PACKAGE in ${packageNames[@]}; do
	dpkg -s $PACKAGE &> /dev/null

	if [ $? -ne 0 ]
	then
		echo -e "- ${PACKAGE} : ${RED}no instalado${DEFAULT}"
		VAR+="\n- ${PACKAGE}"
		PACKAGES+="${PACKAGE} "
	else
		echo -e "+ ${PACKAGE} : ${GREEN}instalado${DEFAULT}"
	fi
done
echo -e "\n"


INSTALL=""
if [[ $VAR ]]
then
	echo -e "${CYAN}Se instalaran los siguientes paquetes:\n${GREEN}${VAR}\n${DEFAULT}"
	INSTALL=true
else
	echo -e "${GREEN}Ya tienes estos paquetes instalados.${DEFAULT}"
fi

if [[ $INSTALL ]]
then
	sudo apt install -y $PACKAGES
fi

printf "\n\n${GREEN}Script finalizado${DEFAULT}\n\n"
