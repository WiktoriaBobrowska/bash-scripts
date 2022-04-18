#!/bin/bash/

if [ $# -eq 0 ];
then
	echo "Uzycie: $(basename $0) user"
	exit 1
else
	echo $(id -G $1)
	echo $(id -nG $1)
fi
