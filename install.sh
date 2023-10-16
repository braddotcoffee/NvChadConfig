#! /bin/bash

CONFIG_PATH="$HOME/.config/NvChadConfig/lua/custom"
INSTALL_PATH="$HOME/.config/nvim/lua/custom"

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
ENDCOLOR="\e[0m"

if [ -L $INSTALL_PATH ] || [ -e $INSTALL_PATH ]; then
  echo -e "${YELLOW}Configuration exists. Would you like to overwrite?${ENDCOLOR}"
  read -p "$(echo -e ${RED}"Overwrite $INSTALL_PATH [Yy] "${ENDCOLOR})" -n 1 -r
  echo ""
  echo ""
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Removing existing config"
    rm -rf $INSTALL_PATH
  else
    echo "Unable to install NvChad configuration."
    exit 1
  fi
fi

echo -e "${GREEN}Installing symlink to $INSTALL_PATH${ENDCOLOR}"
ln -s $CONFIG_PATH $INSTALL_PATH
RESULT=$?

if [ $RESULT -eq 0 ] && [ -e $INSTALL_PATH ]; then
  echo -e "${GREEN}Successfully installed NvChad config!${ENDCOLOR}"
  exit 0
else
  echo -e "${RED}Failed to install NvChad config - please try again.${ENDCOLOR}"
  exit 1
fi
