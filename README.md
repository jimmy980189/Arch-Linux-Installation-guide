# Arch Linux

## Pre

### iso

```
dd if=archlinux-2021.10.01-x86_64.iso of=/dev/sdX
```

### Boot mode (legacy BIOS / UEFI)

```
ls /sys/firmware/efi/efivars
```

### Network Connection

```
ping archlinux.org
```

* check network interdace

  ```
  ip link
  ```

* Wireless

  * rfkill

  * iwctl

    ```
    [iwd]# device list
    [iwd]# station <device name> connect <Network name>
    ```

### Update the system clock

```
timedatectl set-ntp true
timedatectl status
```

### Partition the disks

* lsblk
* fdisk
* use swap or not ?

![image-20211005153502619](/Users/esfpi/Library/Application Support/typora-user-images/image-20211005153502619.png)

[Partitioning#Example layouts](https://wiki.archlinux.org/title/Partitioning#Example_layouts)

### Format the partitions

```
mkfs.ext4 /dev/root_partition
mkswap /dev/swap_partition
mkfs.fat -F32 /dev/efi_system_partition
```

### Mount the file systems

```
mount /dev/root_partition /mnt
mount /dev/efi_system_partition /mnt/boot
swapon /dev/swap_partition
```

## Installation

### Select the mirrors

Edit `/etc/pacman.d/mirrorlist` to make Taiwan's **mirror servers** on top

![image-20211005154400336](/Users/esfpi/Library/Application Support/typora-user-images/image-20211005154400336.png)

### Install essential packages

```
pacstrap /mnt base base-devel linux linux-firmware vim git networkmanager man-db
```

Anything you want to install

## Configure the system

### Fstab

* `-U` define by **UUID** (recommend)
* `-L` define by **labels**

```
genfstab -U /mnt >> /mnt/etc/fstab  #check /mnt/etc/fstab
```

### Chroot

```
arch-chroot /mnt
```

### Time zone

```
ln -sf /usr/share/zoneinfo/Asia/Taipei /etc/localtime
hwclock --systohc #generate /etc/adjtime
```

### Localization

* [Edit](https://wiki.archlinux.org/title/Textedit) `/etc/locale.gen`
* uncomment `en_US.UTF-8 UTF-8`, `zh_TW.UTF-8 UTF-8 `

```
locale-gen
```

**/etc/locale.conf**

Recommend to use **en_US.UTF-8** instead of **zh_TW.UTF-8**

```
LANG=en_US.UTF-8
```

### Network configuration

**/etc/hostname**

```
myhostname
```

**/etc/hosts**

```
127.0.0.1	localhost
::1		localhost
127.0.0.1	myhostname
```

### Initramfs

Creating a new *initramfs* is usually not required, because [mkinitcpio](https://wiki.archlinux.org/title/Mkinitcpio) was run on installation of the [kernel](https://wiki.archlinux.org/title/Kernel) package with *pacstrap*.

```
mkinitcpio -P
```

### Root password

```
passwd
```

### Boot loader (Dual boot with windows)

**!! important !!**

```
pacman -S grub efibootmgr os-prober
os-prober
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
```

### Before Reboot 

**NetworkManager**

```
systemctl enable NetworkManager
systemctl start NetworkManager
```

## Reboot

```
umount -R /mnt
reboot
```

## Post

### pacman

* `-S`
* `-Sy`
* `-Su`
* `-Syu`
* `-Ss`
* `-Qs`

### AUR

have to install **base-devel** package

* `makepkg -si`

### Add user

```
useradd -m -g wheel user_name
passwd user_name
```

edit `/etc/sudoers` to make *user_name* sudoers

### Graphical enviornment

* Desktop Enviornment: **Gnome**, **Unity**, **KDE**, **Xfce** ....
* Window Manager: **i3**, **dwm**, **sway** .....

Just Choose one you like

### dwm

* **dwm** (AUR)
* **dwm-git** (AUR)

### sway

* **wlroots-git** (AUR)
* **sway-git** (AUR)

Each will have different installation (https://wiki.archlinux.org/title/Window_manager)

### Fonts

Choose what you want especially Chinese 

### Whatever you want ....

* Wifi
* Bluetooth
* .....

## Reference

### Arch Linux Wiki

*   https://wiki.archlinux.org/title/Installation_guide
*   https://wiki.archlinux.org/title/GRUB
*   https://wiki.archlinux.org/title/Sway

### Luke Smith

*   https://www.youtube.com/watch?v=4PBqpX0_UOc
*   https://www.youtube.com/watch?v=nSHOb8YU9Gw
*   https://www.youtube.com/watch?v=nCc_4fSYzRA



