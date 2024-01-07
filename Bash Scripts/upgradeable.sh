#!/bin/bash

# Define text color variables
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' # No color

# Function to check if a package is installed
package_installed() {
    dpkg -l | grep -q $1
}

sudo apt clean


# Update package list
echo -e "${CYAN}Updating package list...${NC}"
sudo apt update

# Upgrade existing packages
echo -e "${CYAN}Upgrading packages...${NC}"
sudo apt upgrade -y

# Autoremove unnecessary packages
echo -e "${CYAN}Removing unnecessary packages...${NC}"
sudo apt autoremove -y

# Refresh Snap packages
echo -e "${CYAN}Refreshing Snap packages...${NC}"
snap refresh

# Install upgradable packages
echo -e "${CYAN}Installing upgradable packages...${NC}"
upgradable_packages=$(apt list --upgradable 2>/dev/null | grep -v "Listing..." | awk -F'/' '{print $1}')
for package in $upgradable_packages; do
    if ! package_installed $package; then
        echo -e "${YELLOW}Installing $package...${NC}"
        sudo apt install -y $package
    fi
done

echo -e "${GREEN}Upgrade process complete.${NC}"
