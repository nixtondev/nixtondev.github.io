#!/bin/bash

##  Must be run with sudo.
if [[ $EUID -ne 0 ]]; then
    echo "Screen UPG script must be run with sudo.";
    echo "Run the screenupg.sh by running \"sudo ./updatetest --upg\"";
    exit 1;
fi

# Add colors options & font text options
export ITALIC='\e[3m'
export BOLD='\e[1m'
export DIM='\e[2m'
export UNDERLINE='\e[4m'
export BLINK='\e[5m'
export RESET_ALL='\e[0m'
export REVERSE='\e[7m' #(invert the foreground and background colors)
export HIDDEN='\e[7m' #(useful for passwords)

export COLOR_NC='\e[0m' # No Color
export COLOR_BLACK='\e[0;30m'
export COLOR_GRAY='\e[1;30m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_LIGHT_GRAY='\e[0;37m'
export COLOR_WHITE='\e[1;37m'

export VERSION='0.1.7'


curl https://theinfo.nu/deb/upgradesys.txt
sleep 5

/usr/bin/clear

apt-get_update() {

  # apt-get  Update Systems
  echo -ne "\n  [${COLOR_LIGHT_BLUE}+${RESET_ALL}]   ${COLOR_WHITE}Update linux system.${RESET_ALL} ";
  sudo apt-get update -y >/dev/null 2>&1 && echo -e "  [${COLOR_LIGHT_GREEN}✔ DONE${RESET_ALL}]\n";
  sleep 3

}

apt-get_upgrade(){
  # apt-get Upgrade Systems
  echo -ne "\n  [${COLOR_LIGHT_BLUE}+${RESET_ALL}]   ${COLOR_WHITE}Upgrade linux system.${RESET_ALL} ";
  sudo apt-get upgrade -y >/dev/null 2>&1 && echo -e " [${COLOR_LIGHT_GREEN}✔ DONE${RESET_ALL}]\n";
  sleep 3

}

apt_update() {

  # apt update systems
  echo -ne "\n  [${COLOR_LIGHT_BLUE}+${RESET_ALL}]   ${COLOR_BROWN}Update linux system.${RESET_ALL} ";
  sudo apt update -y >/dev/null 2>&1 && echo -e "  [${COLOR_LIGHT_GREEN}✔ DONE${RESET_ALL}]\n";
  sleep 3

}

apt_upgrade(){

  # apt upgrade systems
  echo -ne "\n  [${COLOR_LIGHT_BLUE}+${RESET_ALL}]   ${COLOR_BROWN}Upgrade linux system.${RESET_ALL} ";
  sudo apt upgrade -y >/dev/null 2>&1 && echo -e " [${COLOR_LIGHT_GREEN}✔ DONE${RESET_ALL}]\n";
  sleep 3

}

apt_autoremove() {

  # apt autoremove systems
  echo -ne "\n  [${COLOR_LIGHT_BLUE}+${RESET_ALL}] ${COLOR_RED}Clearing dependencies that are no longer required in linux system.${RESET_ALL} ";
  sudo apt autoremove -y >/dev/null 2>&1 && echo -e "   [${COLOR_LIGHT_GREEN}✔ DONE${RESET_ALL}]\n";
  sleep 3

}

if [[ $1 == "--upg" ]]; then

  /usr/bin/clear

  curl https://theinfo.nu/deb/upgradesys.txt

  echo -e "\t${DIM}Version${RESET_ALL} ${VERSION}${RESET_ALL}\n"
  echo -e "    ${COLOR_WHITE}Linux updates systems.${RESET_ALL}          [${COLOR_CYAN}+${RESET_ALL}]${COLOR_LIGHT_GREEN}Connected${RESET_ALL}";
  echo -e "    ${COLOR_WHITE}Linux upgrade packages systems.${RESET_ALL} [${COLOR_CYAN}+${RESET_ALL}]${COLOR_LIGHT_GREEN}Connected${RESET_ALL}";
  echo -e "    ${COLOR_BROWN}Linux updates systems.${RESET_ALL}          [${COLOR_CYAN}+${RESET_ALL}]${COLOR_LIGHT_GREEN}Connected${RESET_ALL}";
  echo -e "    ${COLOR_BROWN}Linux upgrade packages systems.${RESET_ALL} [${COLOR_CYAN}+${RESET_ALL}]${COLOR_LIGHT_GREEN}Connected${RESET_ALL}";
  echo -e "    ${COLOR_RED}Linux autoremove system.${RESET_ALL}        [${COLOR_CYAN}+${RESET_ALL}]${COLOR_LIGHT_GREEN}Connected${RESET_ALL}\n"

  echo -e "\t\t${COLOR_PURPLE} A automation screenupg.sh scripts created by The Info Network Technologies.\n ${RESET_ALL}";

  read -p "                 Run upg on linux systems? (y/n) " YesNo

  if [[ $YesNo =~ ^[Yy]$ ]]; then

        apt-get_update;
        apt-get_upgrade;
        apt_update;
        apt_upgrade;
        apt_autoremove;

        /usr/bin/clear

        echo -e [${COLOR_GREEN}?${RESET_ALL}] ${COLOR_LIGHT_PURPLE}"We Installing figlet on your systems now... figlet are text editor."${RESET_ALL}
        sudo apt-get install figlet -y >/dev/null 2>&1 && echo -e "[${COLOR_LIGHT_GREEN}✔ DONE${RESET_ALL}]";
        sleep 3

        /usr/bin/clear

        figlet -f big "All done, have nice day!"

        #echo -e "${COLOR_YELLOW}All are 100% completed....${RESET_ALL}";
  else
        echo -e "\n\t\t  ${COLOR_LIGHT_GRAY}${UNDERLINE}OK: Have nice day, Hi.${RESET_ALL}\n";
        exit 1;
  fi
fi
