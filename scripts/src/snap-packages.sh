#!/bin/bash

packageNames=(
	"dbeaver-ce"
	"firefox"
	"insomnia"
	"mysql-workbench-community"
	"postman"
)


VAR=""
PACKAGES=""
echo -e "Verificando paquetes instalados en Snap:\n"
for PACKAGE in ${packageNames[@]}; do
	sudo snap refresh $PACKAGE &> /dev/null

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
	echo -e "${CYAN}Se instalaran los siguientes paquetes mediante snap:\n${GREEN}${VAR}\n${DEFAULT}"
	INSTALL=true
else
	echo -e "${GREEN}Ya tienes estos paquetes instalados por snap en tu sistema\n\n.${DEFAULT}"
fi

if [[ $INSTALL ]]
then
	sudo snap install $PACKAGES
  snap connect mysql-workbench-community:password-manager-service
  snap connect mysql-workbench-community:ssh-keys
fi

echo -e "Actualizando el resto de paquetes de Snap:\n"
sudo snap refresh --list &> /dev/null
