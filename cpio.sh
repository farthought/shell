#！/bin/bash
cp /boot/$1 .
mkdir initrd
cat $1 | gunzip -d - > bb
cd initrd
cat ../bb | cpio -idm
