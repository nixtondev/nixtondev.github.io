#!/bin/bash

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

## Check for root
if [[ $EUID -ne 0 ]]; then
   echo "Run chrome.sh with sudo."
   exit 1
fi

  echo -e ${COLOR_LIGHT_BLUE}"Install chrome software now."${COLOR_NC}
  sleep 5

  /usr/bin/clear

  echo -e ${COLOR_PURPLE}"Downloading chrome now..."${COLOR_NC}
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb >/dev/null 2>&1 && echo -e "[${COLOR_LIGHT_GREEN}+${COLOR_NC}] Wget installed chrome."
  sleep 3

  /usr/bin/clear

  echo -e ${COLOR_BROWN}"Installing Web Browser now."${COLOR_NC}
  sudo apt install ./google-chrome-stable_current_amd64.deb > /dev/null 2>&1 && echo -e "${COLOR_PURPLE}Installing Chrome now${COLOR_NC}"

  /usr/bin/clear

  echo "All done..."
