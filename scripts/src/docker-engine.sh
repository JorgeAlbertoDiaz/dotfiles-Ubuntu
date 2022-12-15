#!/bin/bash

printf "Verificar si Docker Engine esta instalado\n"

PACKAGE="docker-ce"

dpkg -s ${PACKAGE} &> /dev/null

if [ $? -ne 0 ]
then
	printf "\n- ${PACKAGE} : ${RED}no instalado${DEFAULT}\n\n"

	printf ="\n\n${CYAN}Remueve instalación previa (si existiera) de Docker${DEFAULT}\n"
	sudo apt-get remove docker docker-engine docker.io containerd runc

	printf ="\n\n${CYAN}Descarga y agrega la llave GPG de Docker al repositorio${DEFAULT}\n"
	sudo mkdir -p /etc/apt/keyrings
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

	printf ="\n\n${CYAN}Agrega el repositorio de Microsoft al Sistema${DEFAULT}\n"
	 echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

	sudo apt update

	printf ="\n\n${CYAN}Instala Docker Engine y Docker Compose${DEFAULT}\n"
	sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

	printf ="\n\n${CYAN}Administrar docker como un usuario no root${DEFAULT}\n"
	# sudo groupadd docker
	sudo usermod -aG docker $USER
	newgrp docker

else
	printf "\n+ ${PACKAGE} : ${GREEN}instalado${DEFAULT}\n\n"
fi
