#!/bin/bash
echo $0
find /usr/lib/magos/rootfs-patches/MagOS_2014.64 -type f -name \*.sh | sort | while read a ;do
   echo $a
   bash $a || exit 1
done