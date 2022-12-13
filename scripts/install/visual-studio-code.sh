#!/bin/bash

printf "Verificar si Visual Studio Code esta instalado\n"

PACKAGE="code"

dpkg -s ${PACKAGE} &> /dev/null

if [ $? -ne 0 ]
then
	printf "\n- ${PACKAGE} : ${RED}no instalado${DEFAULT}\n\n"

	printf ="\n\n${CYAN}Descarga y agrega la llave GPG de Microsoft al repositorio${DEFAULT}\n"
	wget -q https://packages.microsoft.com/keys/microsoft.asc -P ~/Downloads/
	sudo apt-key add ~/Downloads/microsoft.asc
	rm ~/Downloads/microsoft.asc
	printf ="\n\n${CYAN}Descarga y agrega la llave GPG de Microsoft al repositorio${DEFAULT}\n"
	sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
	printf ="\n\n${CYAN}Agrega el repositorio de Microsoft al Sistema${DEFAULT}\n"
	sudo apt update
	sudo apt install code -y
else
	printf "\n+ ${PACKAGE} : ${GREEN}instalado${DEFAULT}\n\n"
fi
