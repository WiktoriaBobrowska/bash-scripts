#!/bin/bash

globvar=$(printenv $1) 

if [ $# -eq 0 ];
then 
	echo "brak argumentu"
elif [ ! -z $globvar ]; 
then
	echo "$1=$globvar"
else
	echo "nieznana zmienna"
fi
