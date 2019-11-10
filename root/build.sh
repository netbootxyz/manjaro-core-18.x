#! /bin/bash

# Copy initrd and kernel
mv /boot/vmlinuz-* /buildout/vmlinuz
rm -f /boot/initramfs-*fallback*
mv /boot/initramfs-* /buildout/initrd
chmod 777 /buildout/*

exit 0
