clear

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
ENDCOLOR="\e[0m"

echo -e "Download and install nvm? (y for yes): "
read USER_RESPONSE


if [[ "$USER_RESPONSE" = "y" ]]
    then
		echo -e "${GREEN}Downloading nvm\n${ENDCOLOR}"
        echo -e " - executing ${GREEN}curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash${ENDCOLOR}"
        # curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

		echo -e "${GREEN}\n\nsource ~/.profile\n${ENDCOLOR}"
        source "${HOME}/.bashrc"

		echo -e "${GREEN}\n\nverify installation:\n${ENDCOLOR}"
        # OK=`command -v nvm`
        OK=$($HOME/.nvm/nvm.sh --version)

        echo -e "instalacion: ${OK}"

        if [[ $OK ]]
            then
                echo -e "${GREEN}Instalado correctamente\n${ENDCOLOR}"
            else
                echo -e "${RED}no se instalo\n${ENDCOLOR}"
        fi
            

    else
		echo -e "${RED}NO\n${ENDCOLOR}"
fi
