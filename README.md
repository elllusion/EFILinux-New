# EFI 环境下迷你版的linux

项目修改自 https://github.com/zhovner/OneFileLinux

rootfs 用的是 alpinelinux 的 minirootfs

使用方式：
1. 先运行`chroot.sh`下载并解压rootfs后chroot
2. 再运行`build.sh`编译内核和内核模块并生成虚拟机镜像
