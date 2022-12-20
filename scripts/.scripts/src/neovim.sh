#!/bin/bash

printf "Verificar si neovim esta instalado\n"

PACKAGE="neovim"

INSTALL=0
dpkg -s ${PACKAGE} &> /dev/null

if [ $? -ne 0 ]
then
	printf "\n- ${PACKAGE} : ${RED}no instalado${DEFAULT}\n\n"

	# Se descarga e instala la última versión estable de neovim
	wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb  -O neovim.deb &&  sudo dpkg -i neovim.deb && rm -f neovim.deb

	# Se descarga e instala la última versión estable de lunarvim
	LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

	# Se agrega al repositoro glow (para previsualizar markdown)
	sudo mkdir -p /etc/apt/keyrings
	curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
	echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
	sudo apt update && sudo apt install glow

else
	printf "\n+ ${PACKAGE} : ${GREEN}instalado${DEFAULT}\n\n"
fi
