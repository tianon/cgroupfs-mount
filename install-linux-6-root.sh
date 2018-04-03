#!/bin/bash

chmod 755 cgroupfs cgroupfs-mount cgroupfs-umount
cp -p cgroupfs-mount  /etc/cgroupfs-mount
cp -p cgroupfs-umount /etc/cgroupfs-umount
cp -p cgroupfs /etc/cgroupfs
chkconfig --add cgroupfs
chkconfig cgroupfs on --level 345
chkconfig --list cgroupfs
