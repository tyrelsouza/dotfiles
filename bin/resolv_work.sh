#!/bin/bash

cp /etc/resolv.conf /home/tyrelsouza/prev_resolv.conf

echo > /etc/resolv.conf
echo "nameserver 10.0.2.22" >> /etc/resolv.conf
echo "search addgene.org" >> /etc/resolv.conf
