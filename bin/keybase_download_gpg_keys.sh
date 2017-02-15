#!/bin/bash
keybase list-following | while read -r line ; do
 if [ -n "$line" ]; then
 	curl -s https://keybase.io/$line/key.asc  | gpg --with-fingerprint | sed -n 's/.*=//p' | awk 'NF>1{print $(NF-3)$(NF-2)$(NF-1)$(NF) }' | while read -r key; do
 		echo "Trying $line's key: $key"
 		gpg --recv-key $key
 		echo
 	done
 fi
done
