#!/bin/sh

# Text colors
ERROR='\033[0;31m'
SUCCESS='\033[0;32m'
WHITE='\033[1;37m'

# Installing Node.js dependencies
echo "Checking Node.js is installed"

if !command -v node &> /dev/null
then
    echo "${ERROR}Error: Node.js not installed, please install Node.js before using Webacs"
    exit
fi

echo "${SUCCESS}Node.js installed"
echo "${WHITE}Proceeding with installing Node.js dependencies"

npm install -g typescript-language-server typescript vscode-html-languageserver-bin vscode-css-languageserver-bin vscode-json-languageserver

if [ $? -ne 0 ];
then
    echo "${ERROR}Error installing dependencies, try running script with sudo"
    exit
fi

echo "${SUCCESS}Dependencies installed"

# Initializing Emacs
echo "\n${WHITE}Checking Emacs is installed"

if !command -v emacs &> /dev/null
then
    echo "${ERROR}Error: Emacs not installed, please install Emacs before using Webacs"
    exit
fi

echo "${SUCCESS}Emacs installed"

emacs --batch --eval "(require 'org)" --eval '(org-babel-tangle-file "config.org")' 

if [ $? -ne 0 ];
then
    echo "${ERROR}Error evaluating Emacs config, please try again"
    exit
fi

# Script end
echo "\n${SUCCESS}Webacs successfully installed"
