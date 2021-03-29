#!/bin/sh

# Text colors
ERROR='\033[0;31m'
SUCCESS='\033[0;32m'
WHITE='\033[1;37m'

# Initializing Emacs
echo "\n${WHITE}Checking Emacs is installed"

if !command -v emacs &> /dev/null
then
    echo "${ERROR}Error: Emacs not installed, please install Emacs before using Webacs"
    exit
fi

echo "${SUCCESS}Emacs installed"

emacs --batch --eval "(require 'org)" --eval '(org-babel-tangle-file "~/.emacs.d/bin/config.org")' 

if [ $? -ne 0 ];
then
    echo "${ERROR}Error evaluating Emacs config, please try again"
    exit
fi

# Script end
echo "\n${SUCCESS}Webacs successfully installed"
