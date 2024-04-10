#!bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root / sudo"
  exit
fi

echo -e "\n"
echo "Enter the following information: (TODO)"

# Full system upgrade
echo "Full system upgrade..."
sudo pacman -Syu

# Install ansible
echo "Installing ansible..."
# sudo pacman -S ansible
yay -S ansible-core
ansible-galaxy collection install community.general
