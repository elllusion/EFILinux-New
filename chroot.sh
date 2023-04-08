#!/bin/bash

##################################################################################################
## tinycorelinux
#TINYCORELINUX_VERSION="13.x"
#TINYCORELINUX_ARCH="x86"
#TINYCORELINUX_ROOTFS_NAME="rootfs"

#if [ $TINYCORELINUX_ARCH=="x86_64" ];then
#  TINYCORELINUX_ROOTFS_NAME="rootfs64"
#else
#  TINYCORELINUX_ROOTFS_NAME="rootfs"
#fi

#echo "----------------------------------------------------"
#echo -e "Downloading root filesystem\n"
#wget http://www.tinycorelinux.net/$TINYCORELINUX_VERSION/$TINYCORELINUX_ARCH/release/distribution_files/$TINYCORELINUX_ROOTFS_NAME.gz

##################################################################################################
## ubuntu base
#UBUNTUBASE_VERSION="22.10"
#UBUNTUBASE_ARCH="amd64"

#echo "----------------------------------------------------"
#echo -e "Downloading root filesystem\n"
#wget http://cdimage.ubuntu.com/ubuntu-base/releases/$UBUNTUBASE_VERSION/release/ubuntu-base-$UBUNTUBASE_VERSION-base-$UBUNTUBASE_ARCH.tar.gz

##################################################################################################
## voidlinux
#VOIDLINUX_VERSION="20221001"
#VOIDLINUX_ARCH="x86_64"
#VOIDLINUX_CLIB="glibc"
#VOIDLINUX_CLIBURL=""

#if [ $VOIDLINUX_CLIB="musl" ];then
#  VOIDLINUX_CLIBURL="-musl"
#else
#  VOIDLINUX_CLIBURL=""
#fi

#echo "----------------------------------------------------"
#echo -e "Downloading root filesystem\n"
#wget https://repo-default.voidlinux.org/live/$VOIDLINUX_VERSION/void-$VOIDLINUX_ARCH$VOIDLINUX_CLIBURL-ROOTFS-$VOIDLINUX_VERSION.tar.xz


##################################################################################################
## alpinelinux
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
