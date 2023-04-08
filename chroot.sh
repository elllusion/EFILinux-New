#!/bin/bash

ALPINE_VERSION="v3.17"
ALPINE_SUBVERSION="3.17.3"
ALPINE_ARCH="x86_64"

echo "----------------------------------------------------"
echo -e "Downloading root filesystem\n"
wget https://dl-cdn.alpinelinux.org/alpine/$ALPINE_VERSION/releases/$ALPINE_ARCH/alpine-minirootfs-$ALPINE_SUBVERSION-$ALPINE_ARCH.tar.gz

echo "----------------------------------------------------"
echo -e "Unpacking root filesystem\n"
if [ ! -d rootfs ];then
  mkdir rootfs
fi
cd rootfs
tar -xavf ../alpine-minirootfs-$ALPINE_SUBVERSION-$ALPINE_ARCH.tar.gz
cd ..

echo "----------------------------------------------------"
echo -e "Switching root filesystem\n"
touch rootfs/dev/urandom
mount --bind /dev/urandom rootfs/dev/urandom
chroot rootfs /bin/ash
