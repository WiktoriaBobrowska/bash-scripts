#!/bin/bash

if [ $# -eq 0 ];
then 
	echo "Brak argumentu"
else 
	for i in $@
	do
		echo " " 
		echo "plik $(basename $i)"
		echo "--------------------------------"
		head -n 10 $i
		shift

	done
fi
