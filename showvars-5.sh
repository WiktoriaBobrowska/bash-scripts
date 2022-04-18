#!/bin/bash

if [ $# -eq 0 ];
then
	echo "brak argumentu"
	exit 1
fi 

if [ "$1" == "-n" ];
then
	echo $(printenv | wc -l)
	exit 0
fi

for i
do
	if [ ! -z "$(printenv $i)" ];
	then
		echo $i=$(printenv $i)
	fi
done

