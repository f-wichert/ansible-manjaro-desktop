#!bin/bash

# Verification for sudo rights
if [ "$EUID" -ne 0 ]
  then echo "Please run as root / sudo"
  exit
fi



# System update
read -e -p "Do you want to start a full system upgrade? [Y/n] " -i 'n' response

while true; do
  case "$response" in
      [yY][eE][sS]|[yY])
        echo "Starting full system upgrade..."
        sudo pacman -Syu
        break
        ;;
      *)
        echo "Continuing without system upgrade..."
        break
        ;;
  esac
done


# User Input
echo -e "\n"
echo "Enter the following information:"

echo -e "\n"
echo "Enter your username:"
read -e -p "Enter Ubuntu username: ($SUDO_USER) " -i $SUDO_USER user_login



# Install ansible
echo "Installing ansible..."
yay -S ansible-core
ansible-galaxy collection install community.general

# Execute ansible
ansible-pull -K -U https://github.com/f-wichert/ansible-manjaro-desktop \
  -e "user_login=$user_login" \
  #-e "cron_job_name='first install'" \
  #-e "git_user_name=$git_user_name" \
  #-e "git_user_email=$git_user_email" \


# use --tags "tag1,tag2" to run only the tasks tagged with tag1 and tag2

# use --tags "always" to run only the tasks tagged with "always" (basically the basic stuff)
# run without --tags to run everything

# use --check --diff to make a dry run and see what would change
