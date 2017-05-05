#!/bin/bash
set -v

if [[ $OSTYPE == "darwin*" ]];then
    umount /Volumes/ramdisk
    mysql.server stop
    killall mysqld
    killall mysqld
    killall mysqld
    killall mysqld
    killall mysqld
    killall mysqld
    diskutil erasevolume HFS+ "ramdisk" `hdiutil attach -nomount ram://2048000`
    cp -r /usr/local/var/mysql /Volumes/ramdisk
    mysql.server start
else
    sudo service mysql stop
    
    # This works on Ubuntu 14.04, but not 16.04:
    # sudo mkdir -p /mnt/mysql-data-orig
    # sudo mount --bind /var/lib/mysql /mnt/mysql-data-orig
    # sudo mount -t tmpfs -o size=32G,uid=mysql,gid=mysql,mode=700 tmpfs /var/lib/mysql
    # sudo sh -c 'cp -avi /mnt/mysql-data-orig/* /var/lib/mysql/'
    
    # This works on 16.04 and maybe elsewhere too
    sudo mkdir -p /mnt/mysql-ram
    sudo mount -t tmpfs -o size=8G,uid=mysql,gid=mysql,mode=700 tmpfs /mnt/mysql-ram
    sudo mount -t aufs -o br:/mnt/mysql-ram:/var/lib/mysql=ro aufs /var/lib/mysql
    
    sudo service mysql start
fi
