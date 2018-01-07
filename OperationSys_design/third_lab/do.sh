#!/bin/bash
make
sudo insmod mydrive.ko
dmesg
sudo mknod /dev/mydevice c 250 0
ls /dev

