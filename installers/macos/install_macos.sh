#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

check_homebrew() {
    if command -v brew &>/dev/null; then
        echo -e "${GREEN}Homebrew is installed${NC}"
        return 0
    else
        echo -e "${YELLOW}Homebrew is not installed${NC}"
        return 1
    fi
}

install_homebrew() {
    echo -e "${CYAN}Installing Homebrew...${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    if [[ $(uname -m) == 'arm64' ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        echo 'eval "$(/usr/local/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/usr/local/bin/brew shellenv)"
    fi
}

check_python() {
    if command -v python3 &>/dev/null; then
        PYTHON_VERSION=$(python3 --version)
        echo -e "${GREEN}$PYTHON_VERSION is installed${NC}"

        echo -e "${CYAN}Updating pip...${NC}"
        python3 -m pip install --upgrade pip
        return 0
    else
        echo -e "${YELLOW}Python 3 is not installed${NC}"
        return 1
    fi
}

install_python() {
    echo -e "${CYAN}Installing Python 3...${NC}"
    brew install python@3.11
}

echo -e "${CYAN}DevToolInstaller - Initial Setup${NC}"
echo -e "${CYAN}================================${NC}"

# Check and install Homebrew
if ! check_homebrew; then
    install_homebrew
fi

if ! check_python; then
    install_python

    if check_python; then
        echo -e "${GREEN}Python installation successful${NC}"
    else
        echo -e "${RED}Python installation failed${NC}"
        exit 1
    fi
fi

echo -e "\n${GREEN}Setup completed successfully!${NC}"
echo -e "${GREEN}You can now proceed with DevToolInstaller${NC}"