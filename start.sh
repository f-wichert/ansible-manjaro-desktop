#!bin/bash

# Verification for sudo rights
if [ "$EUID" -ne 0 ]
  then echo "Please run as root / sudo"
  exit
fi



# System update
read -e -p "Do you want to start a full system upgrade? [Y/n]" -i 'Y' response

while true; do
  case "$response" in
      [yY][eE][sS]|[yY])
        echo "Starting full system upgrade..."
        break
        ;;
      *)
        echo "Continuing without system upgrade..."
        exit
        ;;
  esac
done


# User Input
echo -e "\n"
echo "Enter the following information: (TODO)"

read "Do you want to start a full system upgrade? [Y,/n]" -i 'Y' response

# Begin of installation

# Full system upgrade
echo "Full system upgrade..."
sudo pacman -Syu

# Install ansible
echo "Installing ansible..."
# sudo pacman -S ansible
yay -S ansible-core
ansible-galaxy collection install community.general

# Execute ansible
ansible-pull -K -U https://github.com/f-wichert/ansible-manjaro-desktop
