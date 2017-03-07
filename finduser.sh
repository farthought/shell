#!/bin/bash 

cat /etc/passwd | \
	while read line
	do
		echo $line
	done

