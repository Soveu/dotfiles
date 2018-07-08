#!/bin/bash

DIR="~/scripts/aai/dotfiles"
TOCOPY="$(ls -a ~ | awk '/^\.[a-z]/{print}')"

for f in $TOCOPY
do
	cp ~/$f $DIR/$f
done

CONF="i3 i3status midori qutebrowser ranger spotify"

for f in $CONF
do
	mkdir $DIR/.config/$f
	cp -r ~/.config/$f $DIR/.config/$f
done
