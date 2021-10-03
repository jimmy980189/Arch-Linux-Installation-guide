#   Arch-Linux-Installation-guide
>   Arch Linux 安裝與介紹

##  Outline
*   [Introduction](#Introduction)
*   [Pre-installation](#Pre-installation)
*   [Installation](#Installation)
*   [Reboot](#Reboot)
*   [Post-Installation](#Post-Installation)

##  Introduction


##  Pre-installation
*   Prepare an installation medium
*   Boot the live environment
*   Verify the boot mode
*   Connect to the internet
*   Partition
*   mkfs

##  Installation

*   NetworkManager
##  Reboot

##  Post-Installation

### Create User
```shell
useradd -m -g wheel esfpi
```

```shell
passwd esfpi
```

edit sudo access by editing `/etc/sudoers`

### Graphical Envionment

*   Desktop Enviornment
    *   Gnome
    *   Unity
    *   KDE
    *   XFCE

*   Window Manager
    *   i3
    *   sway
    *   dwm

*   Xorg
```shell
pacman -S xorg-server xorg-init
```

*   fonts

*   xf86-video-intel


##  Reference

### Arch Linux Wiki
*   https://wiki.archlinux.org/title/Installation_guide
*   https://wiki.archlinux.org/title/GRUB
*   https://wiki.archlinux.org/title/Sway

### Luke Smith
*   https://www.youtube.com/watch?v=4PBqpX0_UOc
*   https://www.youtube.com/watch?v=nSHOb8YU9Gw
*   https://www.youtube.com/watch?v=nCc_4fSYzRA
