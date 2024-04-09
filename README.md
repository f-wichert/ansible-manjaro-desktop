# ansible-manjaro-desktop

My approach at using ansible to automate my desktop setup, after I messed up my system a couple of times.

This is my ansible solution to setup and configure a new computer.

## Start

I start with a Manjaro i3 "full" install.

Then:
```bash
sudo bash -c "$(wget -O - https://raw.github.com/f-wichert/ansible-manjaro-desktop/master/start.sh)"
```

Reboot after finishing.

## Things you might want to do before starting:

### Telegram (optional)

Setup a telegram bot and have the chat_id and token ready.

This will send notifications in case of success or failure.

## Should I use this as is?

Probably not.

These are my options, and since I'm new to Linux in general, I believe I gonna change a lot of things to fit my needs.

Probably in a daily basis!

### What you can do is:

- Fire a VM, make a fresh install, and then run this.
- See if you like or not the results.
- Fork and change stuff as needed.
- ???
- Profit.

Also:

- do a `dconf dump / > your-dump.txt` on your Ubuntu
- do a `dconf dump / > my-dump.txt` on the VM after everything is installed
- `diff your-dump.txt my-dump.txt` to see the differences (I actually do this on VSCode and it's pretty easy to do)

Use that as a reference to see what you would need to change.

