#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd )"

APPS="$(cat $DIR/apps)"
DESKTOP="$(cat $DIR/desktop)"
DRIVERS="$(cat $DIR/drivers)"
DOTFILES="$(ls $DIR/dotfiles)"
AUR="$(cat $DIR/aur)"

pac(){
	pacman -S reflector
	reflector --score 30 --sort rate --save /etc/pacman.d/mirrorlist

	pacman -S $DRIVERS
	pacman -S $DESKTOP
	pacman -S $APPS
}

sysenable(){
	for s in "$(cat $DIR/services)"
	do
		systemctl enable $s
	done
}

for f in $DOTFILES
do
	cp "$DIR/dotfiles/$f" "$HOME/.$f"
done

mkdir $HOME/git
cd $HOME/git

for a in $AUR
do
	git clone $a
done

for folder in $(ls)
do
	cd $folder
	makepkg -si --skippgpcheck --nocheck
	cd ..
done

sudo pac
sudo sysenable
