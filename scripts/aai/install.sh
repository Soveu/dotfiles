#!/bin/bash

REGION=Poland
ROOTDISK=/dev/sda
ROOTPART=${ROOTDISK}1
HOSTNAME="thiccpad-t420"

vim /etc/pacman.d/mirrorlist
pacstrap /mnt base base-devel vim networkmanager grub
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt

ln -sf /usr/share/zoneinfo/$REGION /etc/localtime
hwclock --systohc

vim /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP=pl" >> /etc/vconsole.conf
echo $HOSTNAME >> /etc/hostname
echo "127.0.0.1	localhost" >> /etc/hosts

grub-install $ROOTDISK
grub-mkconfig -o /boot/grub/grub.cfg

passwd
