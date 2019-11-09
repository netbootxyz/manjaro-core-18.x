#! /bin/bash

# Copy initrd and kernel
mv /boot/vmlinuz-* /mnt/vmlinuz
rm -f /boot/initramfs-*fallback*
mv /boot/initramfs-* /mnt/initrd
chmod 777 /buildout/*

exit 0
