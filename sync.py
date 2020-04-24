#!/usr/bin/python

import shutil
import sys, os

if len(sys.argv) < 3:
    print("not enough args")
    exit(1)

HOME = os.environ.get("HOME")

TARGETS = {
    "vim": [(f"{HOME}/.vim/vimrc", "./vimrc")],
    "bashrc": [(f"{HOME}/.bashrc", "./bashrc")],
    "arch-stuff": [
        (f"{HOME}/.Xdefaults",          "./archstuff/Xdefaults"),
        (f"{HOME}/.Xresources",         "./archstuff/Xresources"),
        (f"{HOME}/.xinitrc",            "./archstuff/xinitrc"),
        (f"{HOME}/.i3blocks.conf",      "./archstuff/i3blocks.conf"),
        (f"{HOME}/.config/i3",          "./archstuff/config/i3"),
        (f"{HOME}/.config/i3status",    "./archstuff/config/i3status"),
        (f"{HOME}/scripts",             "./archstuff/scripts"),
    ],
}

def pull(target):
    print(f"Pulling {target}")
    for pair in TARGETS[target]:
        shutil.copy2(pair[1], pair[0])

def push(target):
    print(f"Pushing {target}")
    for pair in TARGETS[target]:
        shutil.copy2(pair[0], pair[1])

if sys.argv[1] == "push":
    push(sys.argv[2])
elif sys.argv[1] == "pull":
    pull(sys.argv[2])
else:
    print("wrong command")
    exit(1)
