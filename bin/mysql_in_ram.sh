#!/bin/bash
set -v

umount /Volumes/ramdisk
mysql.server stop
killall mysqld
killall mysqld
killall mysqld
diskutil erasevolume HFS+ "ramdisk" `hdiutil attach -nomount ram://2048000`
cp -r /usr/local/var/mysql /Volumes/ramdisk
mysql.server start
