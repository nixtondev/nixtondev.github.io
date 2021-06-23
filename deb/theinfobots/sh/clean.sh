#!/bin/bash

##  Must be run with sudo.
if [[ $EUID -ne 0 ]]; then
    echo "Run this CLEAN script must be run with sudo.";
    exit 1;
fi

OLDSCONF=$( dpkg -l | grep "^rc" | awk '{print $2}')

# Add colors options & font text options
export ITALIC='\e[3m'
export B='\e[1m'
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

    echo -e "${COLOR_LIGHT_BLUE}[+]${RESET_ALL} ${COLOR_YELLOW}Fixing packages pre-configure"${RESET_ALL}
    sudo dpkg --configure -a  >/dev/null 2>&1 && echo -e "\n\t[${COLOR_LIGHT_GREEN}✔ DONE${RESET_ALL}]"
    sleep 5

    /usr/bin/clear

    echo -e "${COLOR_LIGHT_BLUE}[+]${RESET_ALL} ${COLOR_YELLOW}Fix broken packages"${RESET_ALL}
    sudo apt --fix-broken install -y  >/dev/null 2>&1 && echo -e "\n\t[${COLOR_LIGHT_GREEN}✔ DONE${RESET_ALL}]"
    sleep 5

    /usr/bin/clear

    echo -e [${COLOR_LIGHT_BLUE}+${RESET_ALL}] ${COLOR_LIGHT_RED}"Autoremove clearing dependencies that are no longer required in linux system."${RESET_ALL}
    sudo apt autoremove -y >/dev/null 2>&1 && echo -e "\n\t[${COLOR_LIGHT_GREEN}✔ DONE${RESET_ALL}]";
    #echo -e ${GREEN}"All packs are autoremoved, done.."${RESET_ALL}
    sleep 5

    /usr/bin/clear

    echo -e "${COLOR_LIGHT_BLUE}[+]${RESET_ALL} ${COLOR_LIGHT_RED}Clearing retriving packages files${RESET_ALL}"
    sudo apt-get autoclean -y >/dev/null 2>&1 && echo -e "\n\t[${COLOR_LIGHT_GREEN}✔ DONE${RESET_ALL}]"
    sleep 5

    /usr/bin/clear

    echo -e "${COLOR_LIGHT_BLUE}[+]${RESET_ALL} ${COLOR_LIGHT_RED}Clearing olds config files${RESET_ALL}"
    sudo apt-get purge -y $OLDSCONF >/dev/null 2>&1 && echo -e "\n\t[${COLOR_LIGHT_GREEN}✔ DONE${RESET_ALL}]"
    sleep 5

    /usr/bin/clear

    echo -e [${COLOR_GREEN}?${RESET_ALL}] ${COLOR_LIGHT_PURPLE}"We Installing figlet on your systems now... figlet are text editor."${RESET_ALL}
    sudo apt-get install figlet -y >/dev/null 2>&1 && echo -e "\n\t[${COLOR_LIGHT_GREEN}✔ DONE${RESET_ALL}]";
    sleep 3

    /usr/bin/clear

    echo -e "\n\t ${DIM}${UNDERLINE}${ITALIC}A automation clean scripts created by The Info Network Technologies.${RESET_ALL} \t${COLOR_CYAN}Check our website: theinfo.nu${RESET_ALL}"
    sleep 10

    /usr/bin/clear

    figlet -f big "All done...."
