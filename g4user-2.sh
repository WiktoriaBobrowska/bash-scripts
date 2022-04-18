#!/bin/bash

if [[ $# -eq 0 ]];
then 
	echo "Uzycie: $(basename $0) user"
else 
	number=($(id -G $1))
	name=($(id -Gn $1))
	for((i=0; i<"${#number[*]}"; i++));
	do
		echo "${number[$i]} ${name[$i]}"
	done
fi	   
