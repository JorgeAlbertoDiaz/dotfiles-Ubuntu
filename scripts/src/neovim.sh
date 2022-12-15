#!/bin/bash

printf "Verificar si neovim esta instalado\n"

PACKAGE="neovim"

INSTALL=0
dpkg -s ${PACKAGE} &> /dev/null

if [ $? -ne 0 ]
then
	printf "\n- ${PACKAGE} : ${RED}no instalado${DEFAULT}\n\n"
	wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb  -O neovim.deb &&  sudo dpkg -i neovim.deb && rm -f neovim.deb
	bash < (curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
else
	printf "\n+ ${PACKAGE} : ${GREEN}instalado${DEFAULT}\n\n"
fi
