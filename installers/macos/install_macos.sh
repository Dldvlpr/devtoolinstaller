#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

# Function pour la pause
pause() {
    echo -e "\n${YELLOW}Press Enter to exit...${NC}"
    read -r
}

# Variables pour le statut
SETUP_SUCCESS=true

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

if ! check_homebrew; then
    install_homebrew
    if ! check_homebrew; then
        echo -e "${RED}Homebrew installation failed${NC}"
        SETUP_SUCCESS=false
    fi
fi

if [ "$SETUP_SUCCESS" = true ] && ! check_python; then
    install_python
    if ! check_python; then
        echo -e "${RED}Python installation failed${NC}"
        SETUP_SUCCESS=false
    fi
fi

if [ "$SETUP_SUCCESS" = true ]; then
    echo -e "\n${GREEN}[SUCCESS] Setup completed successfully!${NC}"
    echo -e "${GREEN}[SUCCESS] Homebrew is ready${NC}"
    echo -e "${GREEN}[SUCCESS] Python is ready${NC}"
    echo -e "\n${CYAN}You can now use DevToolInstaller!${NC}"
else
    echo -e "\n${RED}[ERROR] Setup encountered problems${NC}"
    echo -e "${RED}Please check the errors above and try again${NC}"
fi

pause