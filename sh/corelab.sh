#!/bin/bash

if [[ $EUID -ne 0 ]]; then
	echo "[ ? ] You must run this script file whit sudo."
	exit 1;
fi

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

export V='2.4.1'

user_log=$(logname)

update(){

	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] System coming be update...";
	sleep 3
	sudo apt-get update >/dev/null 2>&1 && echo "[ ✔ DONE ]";
	sleep 3
	echo -e "[ ${COLOR_LIGHT_GREEN}?${RESET_ALL} ] Search after packages..";
	sleep 5
	echo -e "[ ${COLOR_LIGHT_GREEN}?${RESET_ALL} ] Downloading packages now...";
	sleep 3

}

packages(){

	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Downloading epel-release";
	sudo apt-get install -y epel-release >/dev/null 2>&1 && echo "[ ✔ DONE ]";
	sleep 3
	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Downloading xrdp";
	sudo apt-get install -y xrdp >/dev/null 2>&1 && echo "[ ✔ DONE ]";
	sleep 3
	echo -e "[ ${COLOR_LIGHT_GREEN}?${RESET_ALL} ] Enable xrdp now.";
	sudo systemctl enable xrdp >/dev/null 2>&1 && echo "[ XRDP is Enabled ]";
	sleep 2
	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] XRDP coming starting up now...";
	sudo systemctl start xrdp >/dev/null 2>&1 && echo "[ XRDP is Started now ]";
	sleep 2
	echo -e "[ --XFCE ] Coming be installed.";
	sudo apt-get install -y xfce >/dev/null 2>&1 && echo "[ ✔ DONE ]";
	sleep 2
	echo -e "[ ${COLOR_LIGHT_GREEN}?${RESET_ALL} ] Settings up system now..";
	echo -e "xfce4-session" > ~/.Xclients >/dev/null 2>&1 && echo "Xclients is done..";
	sleep 3
	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Change permissions for file Xclients";
	sudo chmod a+x ~/.Xclients >/dev/null 2>&1 && echo "Changes permissions is done...";
	sleep 3
	echo -e "All is done, Have nice day...";

}

read -p "Run this linux lab config? (Y/n):" YesNo

if [[ $YesNo =~ ^[Yy]$ ]]; then

/usr/bin/clear

echo -e "Linux config system.";

echo -e "Running";

update;
packages;

elif [[ $YesNo =~ ^[Nn]$ ]]; then

	echo "OK well done."
	exit 1;
else
	echo "You must answer y or n."
	exit 1;
fi 

