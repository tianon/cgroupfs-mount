#!/bin/bash

sudo chmod 755 cgroupfs cgroupfs-mount cgroupfs-umount
sudo cp -p cgroupfs-mount  /etc/cgroupfs-mount
sudo cp -p cgroupfs-umount /etc/cgroupfs-umount
sudo cp -p cgroupfs /etc/cgroupfs
sudo chkconfig --add cgroupfs
sudo chkconfig cgroupfs on --level 345
sudo chkconfig --list
