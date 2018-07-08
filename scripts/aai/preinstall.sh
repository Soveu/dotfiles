#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd )"
ROOTDISK=/dev/sda

loadkeys pl
wifi-menu
timedatectl set-ntp true
lsblk

fdisk $ROOTDISK
for p in "$(ls $ROOTDISK[0-4])"
do
	mkfs.ext4 $p
done

mount /dev/sda1 /mnt
mount /dev/sda2 /mnt/home

$DIR/install.sh
