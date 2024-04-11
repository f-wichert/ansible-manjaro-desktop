# Ansible with Manjaro-Desktop Setup
My approach at using ansible to automate my desktop setup, after I messed up my system a couple of times.

This is specifically for a manjaro desktop using i3 as the window manager in combination with polybar. I plan on adding some configuration options but that is for the future. First is getting this ready to be used.


## Setup
1. Don't forget to setup a wifi connection like I did.

2. Start with a Manjaro i3 "full" install.

3. Run the following command. This pulls repo and executes the starting script:
```bash
sudo su -c "bash <(wget -qO- https://raw.github.com/f-wichert/ansible-manjaro-desktop/main/start.sh)" root
```

The above options wont work any longe because I wanted to make the script a little easier to read. Sucks to be you, you gotta exeute two command :O
```bash
git clone https://github.com/f-wichert/ansible-manjaro-desktop.git
```
```bash
bash ansible-manjaro-desktop/start.sh
```


3. Reboot after finishing.


## Things you might want to do before starting:

### Telegram (optional)
Setup a telegram bot and have the chat_id and token ready.

This will send notifications in case of success or failure.


## Should I use this as is?
Probably not. But you are welcome. Feel free to fork and potentially merge, ideally with some user input for text. My dream is to make it easy to setup arch without any prerequisites.


### What you can do is:
- Fire a VM, make a fresh install, and then run this, it wont work from a live usb stick
- See if you like or not the results.
- Fork and change stuff as needed.
- ???
- Profit.


## Future Plans
[] Add options to execute just parts of the playbook, like only setting up polybar or zsh
[] Extend this to work with base arch as well


## Constants in the script
There are a few potential sources of errors, so if something is not working for you, this section is meant as a little documentation of what might be wrong

1. oh my zsh install script
2. omz theme location