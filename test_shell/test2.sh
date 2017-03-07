#!/bin/bash 
PATH1="$HOME/test/dir1/"
PATH2="$HOME/test/dir2/"
conf()
{
	if [ -e $1 ];then
		if [ -e $2 ];then
			rm $2
		fi
		mv $1 $3
	fi
}

conf $PATH1/1.txt $PATH2/2.txt $PATH2

