#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

if [ "$EUID" -ne 0 ]; then
    echo -e "${RED}Please run this script with sudo${NC}"
    exit 1
fi

detect_distro() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        OS=$NAME
        VERSION=$VERSION_ID
    else
        OS=$(uname -s)
        VERSION=$(uname -r)
    fi
}

install_python_debian() {
    echo -e "${CYAN}Updating package lists...${NC}"
    apt-get update

    echo -e "${CYAN}Installing Python 3...${NC}"
    apt-get install -y python3 python3-pip
}

install_python_redhat() {
    echo -e "${CYAN}Installing Python 3...${NC}"
    dnf install -y python3 python3-pip
}

check_python() {
    if command -v python3 &>/dev/null; then
        PYTHON_VERSION=$(python3 --version)
        echo -e "${GREEN}$PYTHON_VERSION is installed${NC}"

        # Update pip
        echo -e "${CYAN}Updating pip...${NC}"
        python3 -m pip install --upgrade pip
        return 0
    else
        echo -e "${YELLOW}Python 3 is not installed${NC}"
        return 1
    fi
}

echo -e "${CYAN}DevToolInstaller - Initial Setup${NC}"
echo -e "${CYAN}================================${NC}"

detect_distro
echo -e "${CYAN}Detected OS: $OS${NC}"

if ! check_python; then
    case "$OS" in
        "Ubuntu"|"Debian GNU/Linux")
            install_python_debian
            ;;
        "CentOS Linux"|"Red Hat Enterprise Linux"|"Fedora")
            install_python_redhat
            ;;
        *)
            echo -e "${RED}Unsupported distribution: $OS${NC}"
            exit 1
            ;;
    esac

    if check_python; then
        echo -e "${GREEN}Python installation successful${NC}"
    else
        echo -e "${RED}Python installation failed${NC}"
        exit 1
    fi
fi

echo -e "\n${GREEN}Setup completed successfully!${NC}"
echo -e "${GREEN}You can now proceed with DevToolInstaller${NC}"