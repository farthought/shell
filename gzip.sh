#!/bin/bash
if [ -e $1 ];then
	rm $1
fi
cd initrd
find | cpio -o -H Newc > ../$1
cd ..
gzip $1
mv $1.gz $1
