#!/bin/bash

printf "Verificar si Google Chrome esta instalado\n\n"

PACKAGE="google-chrome-stable"

INSTALL=0
dpkg -s ${PACKAGE} &> /dev/null

if [ $? -ne 0 ]
then
	printf "\n- ${PACKAGE} : ${RED}no instalado${DEFAULT}\n\n"
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P ~/Downloads/
	sudo dpkg -i ~/Downloads/google-chrome-stable_current_amd64.deb
	rm ~/Downloads/google-chrome-stable_current_amd64.deb
else
	printf "\n+ ${PACKAGE} : ${GREEN}instalado${DEFAULT}\n\n"
fi
