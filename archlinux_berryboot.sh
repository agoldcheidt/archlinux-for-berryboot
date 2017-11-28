#!/bin/bash

# ArchLinux ARM OS Image Generator for Berryboot
# Copyright 2017 Alexander G.
# http://www.alexgoldcheidt.com
# https://github.com/agoldcheidt

if [ "$EUID" -ne 0 ]
then 
    echo 1>&2 "Please run as root"
    exit 1
fi

# Download URLs
URL1="http://ca.us.mirror.archlinuxarm.org/os/ArchLinuxARM-rpi-latest.tar.gz"
URL2="http://ca.us.mirror.archlinuxarm.org/os/ArchLinuxARM-rpi-2-latest.tar.gz"
URL3="http://ca.us.mirror.archlinuxarm.org/os/ArchLinuxARM-rpi-3-latest.tar.gz"

# Names for Converted OS Images
NAME1="archlinuxarm_latest_rpi1_zero_berryboot.img"
NAME2="archlinuxarm_latest_rpi2_berryboot.img"
NAME3="archlinuxarm_latest_rpi3_berryboot.img"

echo ""
echo "#### ARCHLINUX ARM OS IMAGE GENERATOR FOR BERRYBOOT ####"
echo ""

# ArchLinux OS Image Menu Selection
PS3='Please select your device: '
options=("Raspberry Pi 1/Zero" "Raspberry Pi 2" "Raspberry Pi 3" "Exit")
select opt in "${options[@]}"
do
    case $opt in
        "Raspberry Pi 1/Zero")
echo ""
echo "#### DOWNLOADING OS IMAGE ####"
echo ""
            wget $URL1
			sudo mkdir ArchLinux1
echo ""
echo "#### DECOMPRESSING OS IMAGE ####"
echo ""
			sudo bsdtar -xpf ArchLinuxARM-rpi-latest.tar.gz -C ArchLinux1
echo ""
echo "#### CONVERTING OS IMAGE TO BERRYBOOT ####"
echo ""
			sudo mksquashfs ArchLinux1/ $NAME1 -comp lzo -e lib/modules var/lib/pacman/local
			sudo rm -f ArchLinuxARM-rpi-latest.tar.gz		
			sudo rm -rf ArchLinux1
echo ""
echo "#### IMAGE READY! ####"
echo ""
			break
            ;;
        "Raspberry Pi 2")
echo ""
echo "#### DOWNLOADING OS IMAGE ####"
echo ""
            wget $URL2
			sudo mkdir ArchLinux2
echo ""
echo "#### DECOMPRESSING OS IMAGE ####"
echo ""
			sudo bsdtar -xpf ArchLinuxARM-rpi-2-latest.tar.gz -C ArchLinux2
echo ""
echo "#### CONVERTING OS IMAGE TO BERRYBOOT ####"
echo ""
			sudo mksquashfs ArchLinux2/ $NAME2 -comp lzo -e lib/modules var/lib/pacman/local
			sudo rm -f ArchLinuxARM-rpi-2-latest.tar.gz		
			sudo rm -rf ArchLinux2
echo ""
echo "#### IMAGE READY! ####"
echo ""
			break
            ;;
        "Raspberry Pi 3")
echo ""
echo "#### DOWNLOADING OS IMAGE ####"
echo ""
            wget $URL3
			sudo mkdir ArchLinux3
echo ""
echo "#### DECOMPRESSING OS IMAGE ####"
echo ""
			sudo bsdtar -xpf ArchLinuxARM-rpi-3-latest.tar.gz -C ArchLinux3
echo ""
echo "#### CONVERTING OS IMAGE TO BERRYBOOT ####"
echo ""
			sudo mksquashfs ArchLinux3/ $NAME3 -comp lzo -e lib/modules var/lib/pacman/local
			sudo rm -f ArchLinuxARM-rpi-3-latest.tar.gz		
			sudo rm -rf ArchLinux3
echo ""
echo "#### IMAGE READY! ####"
echo ""
			break
            ;;
        "Exit")
            break
            ;;
        *) echo invalid option;;
    esac
done
