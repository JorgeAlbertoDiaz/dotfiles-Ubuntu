#!/bin/bash

packageNames=(
	"apt-transport-https"
	"ca-certificates"
	"composer"
	"curl"
	"fd-find"
	"ffmpegthumbnailer"
	"figlet"
	"fzf"
	"git"
	"gnupg"
	"libapache2-mod-php8.1"
	"libmysqlclient-dev"
	"libxext-dev"
	"lsb-release"
	"lua5.2"
	"mysql-server-8.0"
	"neofetch"
	"neovim"
	"nodejs"
	"npm"
	"php8.1"
	"php8.1-cli"
	"php8.1-curl"
	"php8.1-fpm"
	"php8.1-intl"
	"php8.1-mysql"
	"php8.1-pgsql"
	"php8.1-sqlite3 "
	"php8.1-zip"
	"poppler-utils"
	"ripgrep"
	"screenfetch"
	"software-properties-common"
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

