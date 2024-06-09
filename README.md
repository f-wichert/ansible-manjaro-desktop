# Ansible with Manjaro-Desktop Setup
This is my approach at using ansible to automate my desktop setup. It is specifically for a manjaro desktop using i3 in combination with polybar. I plan on adding some configuration options but that is for the future. First is getting this ready to be used.


## Preview
Here are some screenshots of what you can expect:

![Desktop Preview](https://github.com/f-wichert/ansible-manjaro-desktop/blob/main/res/desktop_preview.png?raw=true)

![ZSH Preview](https://github.com/f-wichert/ansible-manjaro-desktop/blob/main/res/zsh_theme.png?raw=true)


## Setup
### From Scratch
1. Don't forget to setup a wifi connection like I did.

2. Start with a Manjaro i3 "full" install.

3. Pull the repo:
```bash
git clone https://github.com/f-wichert/ansible-manjaro-desktop.git
```

3. (Temporary step) There is still a small error in the script. To avoid that, simply run these commands by hand and ignore the ansible insallation from the script:
```bash
yay -S ansible-core
ansible-galaxy collection install community.general
ansible-galaxy collection install kewlfft.aur
```

4. Execute the starting script. Enter you systems password when prompted "BECOME". Don't worry, some of the installation steps take a bit, so don't worry if it seems like nothing happens. For me the whole script took around 10 minutes, depending on your internet.
```bash
bash ansible-manjaro-desktop/start.sh
```

5. Reboot after finishing.


### With installed dependencies
1. (Alternative) If your system is up to date and you have ansible installed, plus all the ansible-galaxy requirements, you can pull the playbook directly, though you will have to set the input variables by hand:
```bash
ansible-pull -K -U https://github.com/f-wichert/ansible-manjaro-desktop -e user_login={{ your_username }} --tags "packages,oh-my-zsh,i3,polybar"
```


## Install options
The install options are given as tags to the playbook, when executing the starting script, this includes all tags. In case you want to execute only parts of the playbook, here are the tags used. They handle which parts of the system will be installed. They include things such as:

- setup
    - Handles things which need to be done before the actual base step, such as setting permissions etc.
- base
    - This is where the magic happens. This tag includes all things that are relevant to you as a user that you will see.
    - packages
    - oh-my-zsh
    - polybar
    - i3-config
- cleanup 
    - Cleans leftovers from setup and base, like removal of temp files etc.

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
- [] Add option for external .dotfiles repositories
- [] Maybe add different themes to choose from
- [] Definitely add some backups for packages, files etc. if they are failed to be retrieved


## Credits
Credit where credit is due, this is heavily inspired by other [repos](https://github.com/jothi-prasath/archlinux-playbook?tab=readme-ov-file). I created this to have a personalized setup experience and to learn something. Also because earlier the day of starting this repo I bombed my system. Again.
[This](https://github.com/j-milkovits/.dotfiles/tree/main) is were I took inspiration for most of my dotfiles to configure polybar. Works like a charm and looks good. 

