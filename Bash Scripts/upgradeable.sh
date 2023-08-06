#!/bin/bash

sudo apt update && apt upgrade -y   
# Updates the list of available packages and upgrades existing packages to their latest versions.
# get list of upgradable packages
packages=$(apt list --upgradable 2>/dev/null | grep -v "Listing..." | awk -F'/' '{print $1}')
# Retrieves the list of upgradable packages, excludes any error message output and removes the header line, and extracts only the package names.

for package in $packages; do
  sudo apt install -y "$package"  
done

snap refresh