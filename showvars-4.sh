#!/bin/bash

if [ $# -eq 0 ];
then
	echo "brak argumentu"
	exit 1
fi 

create=false

if [ "$1" == "-c" ];
then
	create=true
	shift
fi

for i
do
	if $create;
	then
		eval ${i,,}=$(printenv $i)
		echo ${i,,}=$(printenv $i)
	else 
		echo $i=$(printenv $i)
	fi
done

