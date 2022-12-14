#!/bin/bash

packageNames=(
	"mysql-workbench-community"
	"dbeaver-ce"
	"insomnia"
	"postman"
)


VAR=""
PACKAGES=""
echo -e "Verificando paquetes instalados:\n"
for PACKAGE in ${packageNames[@]}; do
	$PACKAGE --version &> /dev/null

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
	sudo snap install $PACKAGES
fi

echo -e "\n\n"