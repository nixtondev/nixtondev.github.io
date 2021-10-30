#!/bin/bash

if [[ $EUID -ne 0 ]]; then
	echo "[ ? ] You must run with sudo."
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

export V='3.1.4'

user_log=$(logname)


sshconf(){

	echo -e "[ ${COLOR_CYAN}?${RESET_ALL} ] Configure ssh lab for you systems";
	curl -1sLf 'https://dl.cloudsmith.io/public/asbru-cm/release/cfg/setup/bash.deb.sh' | sudo -E bash >/dev/null 2>&1 && echo "[ ${COLOR_LIGHT_GREEN}DONE${RESET_ALL} ]";
	sleep 3
	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Installing connection manager..."
	sleep 3

}

sshinstall(){

	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Target connections manager";
	sleep 3
	sudo apt install asbru-cm >/dev/null 2>&1 && echo "[ ${COLOR_LIGHT_GREEN}DONE${RESET_ALL} ]";
	sleep 3
	echo -e "Now you have better connection manager ssh lab";

}

if [[ $1 == "--ssh" ]]; then
/usr/bin/clear

	echo -e "Welcome ${user_log}\n";
	echo -e "Version: ${COLOR_LIGHT_GREEN}${V}${RESET_ALL} / Created by ShadBoyMe."
	echo -e "For DEBIAN/UBUNTU systems.\n";

	read -p "Download Connection manager ssh? (Y/n):" YesNo

if [[ $YesNo =~ ^[Yy]$ ]]; then

	echo -e "${COLOR_RED}${BLINK}Running now${RESET_ALL}"
	sshconf;
	sshinstall;

elif [[ $YesNo =~ ^[Nn]$ ]]; then
	echo -e "OK, Well done."
	exit 1;
else
	echo -e "[ ? ] You must answer Y or N"
	exit 1;
fi
else
	echo -e "[ ? ] Test sudo ./sshlab.sh --ssh"
	exit 1;
fi
