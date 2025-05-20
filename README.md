# Ansible with Manjaro-Desktop Setup
This is my approach at using ansible to automate my desktop setup, and serves primarily as a quick way for me to get a new laptop or pc up and running with the configurations I prefer.

It is specifically designed for a manjaro desktop using i3 in combination with polybar. I plan on adding some configuration options but that has yet to happen.



## Preview
Here are some screenshots of what you can expect:

![Desktop Preview](https://github.com/f-wichert/ansible-manjaro-desktop/blob/main/res/desktop_preview.png?raw=true)

![ZSH Preview](https://github.com/f-wichert/ansible-manjaro-desktop/blob/main/res/zsh_theme.png?raw=true)



## Setup
### Setting up a clean Manjaro i3 version
Start from here if you do not have a clean Manjaro installation ready.

1. Download the "full" Manjaro i3 version from [here](https://manjaro.org/products/download/x86)

2. Create a bootable USB drive. You can use [rufus](https://rufus.ie/en/) on Windows, or follow [this](https://wiki.manjaro.org/index.php/Burn_an_ISO_File) tutorial on linux

3. Boot up the USB drive and follow the installation instructions

### Executing the installation script
From this point forward I assume you have a clean Manjari i3 installation.

1. Establish an internet connection, for example using the [nmtui](https://wiki.archlinux.org/title/NetworkManager) command

2. Clone the repo.
```bash
git clone https://github.com/f-wichert/ansible-manjaro-desktop.git
```

4. Execute the starting script. This step may take some time, depending on your internect connection and chosen modules. 
```bash
bash ansible-manjaro-desktop/start.sh
```

5. Reboot after finishing.

### Only executing the ansible playbook
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

