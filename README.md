# Ansible with Manjaro-Desktop Setup
This is my approach at using ansible to automate my desktop setup. It is specifically for a manjaro desktop using i3 in combination with polybar. I plan on adding some configuration options but that is for the future. First is getting this ready to be used.



## Setup
### From Scratch
1. Don't forget to setup a wifi connection like I did.

2. Start with a Manjaro i3 "full" install.

3. Run the following command. This pulls repo and executes the starting script:
```bash
sudo su -c "bash <(wget -qO- https://raw.github.com/f-wichert/ansible-manjaro-desktop/main/start.sh)" root
```

The above options wont work any longe because I wanted to make the script a little easier to read. Sucks to be you, you gotta exeute two commands :O
```bash
git clone https://github.com/f-wichert/ansible-manjaro-desktop.git
```
```bash
bash ansible-manjaro-desktop/start.sh
```

4. Reboot after finishing.


### With installed dependencies
1. (Alternative) If your system is up to date and you have ansible installed, plus all the ansible-galaxy requirements, you can pull the playbook directly, though you will have to set the input variables by hand:
```bash
ansible-pull -K -U https://guthub.com/f-wichert/ansible-manjaro-desktop -e user_login={{ your_username }} --tags "packages,oh-my-zsh,i3,polybar"
```


## Install options
The install options are given as tags to the playbook. They handle which parts of the system will be installed. They include things such as:

- packages
- oh-my-zsh
- polybar
- i3

All of these will be installed with my personal config files. 




## Things you might want to do before starting:

### Telegram (optional)
Setup a telegram bot and have the chat_id and token ready.

This will send notifications in case of success or failure.


## Should I use this as is?
Probably not. But you are welcome. This playbook sets up a system to immedeately use. This includes my preferred configs and packages. But: feel free to fork and potentially merge. My dream is to make it easy to setup arch without any prerequisites.


### What you can do is:
- Fire a VM, make a fresh install, and then run this, it wont work from a live usb stick
- See if you like or not the results.
- Fork and change stuff as needed.
- ???
- Profit.


## Future Plans
- [] Add options to execute just parts of the playbook, like only setting up polybar or zsh
- [] Extend this to work with base arch as well


## Credits
Credit where credit is due, this is heavily inspired by other [repos](https://github.com/jothi-prasath/archlinux-playbook?tab=readme-ov-file). I created this to have a personalized setup experience and to learn something. Also because earlier the day of starting this I bombed my system.
