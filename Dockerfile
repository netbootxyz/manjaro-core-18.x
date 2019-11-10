FROM archlinux

# add local files
COPY /root /

RUN \
 echo "**** install deps ****" && \
 pacman -Sy && \
 pacman -S --noconfirm \
	manjaro-tools-iso \
	mkinitcpio-nfs-utils && \
 echo "**** patch files ****" && \
 sed -i \
	's/${misobasedir}\/${arch}//g' \
	/etc/initcpio/hooks/miso_pxe_http && \
 sed -i \
	'/^HOOKS=(/c\HOOKS=(base udev modconf block filesystems keyboard fsck net miso miso_pxe_common miso_pxe_http)' \
	/etc/mkinitcpio.conf && \
 echo "**** install kernel ****" && \
 pacman -S --noconfirm \
	linux53 && \
 echo "**** paths ****" && \
 mkdir -p \
	/buildout

ENTRYPOINT [ "/build.sh" ]
