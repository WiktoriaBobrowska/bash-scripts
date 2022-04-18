#!/bin/bash

while getopts ":r" opt; do
    case $opt in
        r) r=1;;
    esac
done

if [ $# -eq 0 ];
then
	echo "Niepoprawny argument: numer linii musi byc rozny od 0."
fi

shift $((OPTIND-1))
file=$1
shift
for i in $@
do 	
	if [[ -z $r ]]; 
	then
		echo "$(cat $file | head -n$i | tail -n1)"
	else 
		echo "$(cat $file | tail -n$i | head -n1)"
	fi
done	
