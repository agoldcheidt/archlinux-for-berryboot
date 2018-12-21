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

#date
date=$(date +"%d-%b-%Y")
clear

#Some arwork...
echo "------------------------------------------------------------";
echo "    _          _    _    _                 _   ___ __  __ ";
echo "   /_\  _ _ __| |_ | |  (_)_ _ _  ___ __  /_\ | _ \  \/  |";
echo "  / _ \| '_/ _| ' \| |__| | ' \ || \ \ / / _ \|   / |\/| |";
echo " /_/ \_\_| \__|_||_|____|_|_||_\_,_/_\_\/_/ \_\_|_\_|  |_|";
echo " 2018.12.21                                               ";
echo "------------------------------------------------------------";

# Download URLs
URL1="http://fl.us.mirror.archlinuxarm.org/os/ArchLinuxARM-rpi-latest.tar.gz"
URL2="http://fl.us.mirror.archlinuxarm.org/os/ArchLinuxARM-rpi-2-latest.tar.gz"
URL3="http://fl.us.mirror.archlinuxarm.org/os/ArchLinuxARM-rpi-3-latest.tar.gz"

# Names for Converted OS Images
NAME1="archlinuxarm_official_rpi1_zero_berryboot-$date.img"
NAME2="archlinuxarm_official_rpi2_rpi3_berryboot-$date.img"
NAME3="archlinuxarm_official_rpi3_berryboot-$date.img"

echo ""
echo "#### ARCHLINUX ARM OS IMAGE GENERATOR FOR BERRYBOOT ####"
echo ""

# ArchLinux OS Image Menu Selection
PS3='Please select your device: '
options=("Raspberry Pi 1/Zero" "Raspberry Pi 2" "Raspberry Pi 3" "All Raspberry Pi Devices" "Exit")
select opt in "${options[@]}"
do
    case $opt in
        "Raspberry Pi 1/Zero")
clear
echo ""
echo "#### DOWNLOADING OS IMAGE RPI1/ZERO ####"
echo ""
            wget $URL1
			sudo mkdir ArchLinux1
clear
echo ""
echo "#### DECOMPRESSING OS IMAGE RPI1/ZERO ####"
echo ""
			sudo bsdtar -xpf ArchLinuxARM-rpi-latest.tar.gz -C ArchLinux1
clear
echo ""
echo "#### CONVERTING OS IMAGE TO BERRYBOOT RPI1/ZERO ####"
echo ""
			sudo sed -i 's/^\/dev\/mmcblk/#\0/g' ArchLinux1/etc/fstab
			sudo sed -i 's/^\/dev\/root/#\0/g' ArchLinux1/etc/fstab
			sudo sed -i 's/^\PARTUUID/#\0/g' ArchLinux1/etc/fstab
			sudo sed -i 's/^\UUID/#\0/g' ArchLinux1/etc/fstab
			sudo sed -i 's/^\LABEL/#\0/g' ArchLinux1/etc/fstab
			sudo mksquashfs ArchLinux1/ $NAME1 -comp lzo -e lib/modules var/lib/pacman/local
			sudo rm -f ArchLinuxARM-rpi-latest.tar.gz
			sudo rm -rf ArchLinux1
clear
echo ""
echo "#### IMAGE READY FOR RPI1/ZERO ####"
echo ""
echo "-----------------------------------------------";
echo "Support my project at: patreon.com/berryserver/";
echo "-----------------------------------------------";
			break
            ;;
        "Raspberry Pi 2")
clear
echo ""
echo "#### DOWNLOADING OS IMAGE RPI2/RPI3 ####"
echo ""
            wget $URL2
			sudo mkdir ArchLinux2
clear
echo ""
echo "#### DECOMPRESSING OS IMAGE RPI2/RPI3 ####"
echo ""
			sudo bsdtar -xpf ArchLinuxARM-rpi-2-latest.tar.gz -C ArchLinux2
clear
echo ""
echo "#### CONVERTING OS IMAGE TO BERRYBOOT RPI2/RPI3 ####"
echo ""
			sudo sed -i 's/^\/dev\/mmcblk/#\0/g' ArchLinux2/etc/fstab
			sudo sed -i 's/^\/dev\/root/#\0/g' ArchLinux2/etc/fstab
			sudo sed -i 's/^\PARTUUID/#\0/g' ArchLinux2/etc/fstab
			sudo sed -i 's/^\UUID/#\0/g' ArchLinux2/etc/fstab
			sudo sed -i 's/^\LABEL/#\0/g' ArchLinux2/etc/fstab
			sudo mksquashfs ArchLinux2/ $NAME2 -comp lzo -e lib/modules var/lib/pacman/local
			sudo rm -f ArchLinuxARM-rpi-2-latest.tar.gz
			sudo rm -rf ArchLinux2
clear
echo ""
echo "#### IMAGE READY FOR RPI2/RPI3 ####"
echo ""
echo "-----------------------------------------------";
echo "Support my project at: patreon.com/berryserver/";
echo "-----------------------------------------------";
			break
            ;;
        "Raspberry Pi 3")
clear
echo ""
echo "#### DOWNLOADING OS IMAGE RPI3 ####"
echo ""
            wget $URL3
			sudo mkdir ArchLinux3
clear
echo ""
echo "#### DECOMPRESSING OS IMAGE RPI3 ####"
echo ""
			sudo bsdtar -xpf ArchLinuxARM-rpi-3-latest.tar.gz -C ArchLinux3
clear
echo ""
echo "#### CONVERTING OS IMAGE TO BERRYBOOT RPI3 ####"
echo ""
			sudo sed -i 's/^\/dev\/mmcblk/#\0/g' ArchLinux3/etc/fstab
			sudo sed -i 's/^\/dev\/root/#\0/g' ArchLinux3/etc/fstab
			sudo sed -i 's/^\PARTUUID/#\0/g' ArchLinux3/etc/fstab
			sudo sed -i 's/^\UUID/#\0/g' ArchLinux3/etc/fstab
			sudo sed -i 's/^\LABEL/#\0/g' ArchLinux3/etc/fstab
			sudo mksquashfs ArchLinux3/ $NAME3 -comp lzo -e lib/modules var/lib/pacman/local
			sudo rm -f ArchLinuxARM-rpi-3-latest.tar.gz
			sudo rm -rf ArchLinux3
clear
echo ""
echo "#### IMAGE READY FOR RPI3 ####"
echo ""
echo "-----------------------------------------------";
echo "Support my project at: patreon.com/berryserver/";
echo "-----------------------------------------------";
			break
            ;;			
			"All Raspberry Pi Devices")
clear
echo ""
echo "#### DOWNLOADING OS IMAGE RPI1/ZERO ####"
echo ""
            wget $URL1
			sudo mkdir ArchLinux1
clear
echo ""
echo "#### DECOMPRESSING OS IMAGE RPI1/ZERO ####"
echo ""
			sudo bsdtar -xpf ArchLinuxARM-rpi-latest.tar.gz -C ArchLinux1
clear
echo ""
echo "#### CONVERTING OS IMAGE TO BERRYBOOT RPI1/ZERO ####"
echo ""
			sudo sed -i 's/^\/dev\/mmcblk/#\0/g' ArchLinux1/etc/fstab
			sudo sed -i 's/^\/dev\/root/#\0/g' ArchLinux1/etc/fstab
			sudo sed -i 's/^\PARTUUID/#\0/g' ArchLinux1/etc/fstab
			sudo sed -i 's/^\UUID/#\0/g' ArchLinux1/etc/fstab
			sudo sed -i 's/^\LABEL/#\0/g' ArchLinux1/etc/fstab
			sudo mksquashfs ArchLinux1/ $NAME1 -comp lzo -e lib/modules var/lib/pacman/local
			sudo rm -f ArchLinuxARM-rpi-latest.tar.gz
			sudo rm -rf ArchLinux1
clear
echo ""
echo "#### IMAGE READY FOR RPI1/ZERO ####"
echo ""
#######
clear
echo ""
echo "#### DOWNLOADING OS IMAGE RPI2/RPI3 ####"
echo ""
            wget $URL2
			sudo mkdir ArchLinux2
clear
echo ""
echo "#### DECOMPRESSING OS IMAGE RPI2/RPI3 ####"
echo ""
			sudo bsdtar -xpf ArchLinuxARM-rpi-2-latest.tar.gz -C ArchLinux2
clear
echo ""
echo "#### CONVERTING OS IMAGE TO BERRYBOOT RPI2/RPI3 ####"
echo ""
			sudo sed -i 's/^\/dev\/mmcblk/#\0/g' ArchLinux2/etc/fstab
			sudo sed -i 's/^\/dev\/root/#\0/g' ArchLinux2/etc/fstab
			sudo sed -i 's/^\PARTUUID/#\0/g' ArchLinux2/etc/fstab
			sudo sed -i 's/^\UUID/#\0/g' ArchLinux2/etc/fstab
			sudo sed -i 's/^\LABEL/#\0/g' ArchLinux2/etc/fstab
			sudo mksquashfs ArchLinux2/ $NAME2 -comp lzo -e lib/modules var/lib/pacman/local
			sudo rm -f ArchLinuxARM-rpi-2-latest.tar.gz
			sudo rm -rf ArchLinux2
clear
echo ""
echo "#### IMAGE READY FOR RPI2/RPI3 ####"
echo ""
#######
clear
echo ""
echo "#### DOWNLOADING OS IMAGE RPI3 ####"
echo ""
            wget $URL3
			sudo mkdir ArchLinux3
clear
echo ""
echo "#### DECOMPRESSING OS IMAGE RPI3 ####"
echo ""
			sudo bsdtar -xpf ArchLinuxARM-rpi-3-latest.tar.gz -C ArchLinux3
clear
echo ""
echo "#### CONVERTING OS IMAGE TO BERRYBOOT RPI3 ####"
echo ""
			sudo sed -i 's/^\/dev\/mmcblk/#\0/g' ArchLinux3/etc/fstab
			sudo sed -i 's/^\/dev\/root/#\0/g' ArchLinux3/etc/fstab
			sudo sed -i 's/^\PARTUUID/#\0/g' ArchLinux3/etc/fstab
			sudo sed -i 's/^\UUID/#\0/g' ArchLinux3/etc/fstab
			sudo sed -i 's/^\LABEL/#\0/g' ArchLinux3/etc/fstab
			sudo mksquashfs ArchLinux3/ $NAME3 -comp lzo -e lib/modules var/lib/pacman/local
			sudo rm -f ArchLinuxARM-rpi-3-latest.tar.gz
			sudo rm -rf ArchLinux3
clear
echo ""
echo "#### IMAGE READY FOR ALL RPI DEVICES ####"
echo ""
echo "-----------------------------------------------";
echo "Support my project at: patreon.com/berryserver/";
echo "-----------------------------------------------";
			break
            ;;
        "Exit")
            break
            ;;
        *) echo invalid option;;
    esac
done
