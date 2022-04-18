#!/bin/bash  

file="$(cat $1)"
prog=$2
part=$3

if [[ -z $part ]];
then	
	file2=$(echo "$file" | grep "$3" | awk '{print $5}' | tr -d '%')
	if [[ $file2 > $prog ]];
	then
		echo "$part $prog $file2"
	fi
else 
	echo "$file2 | tr -d '%' | awk -k k='$prog' '{if($5>='$prog') print $6 $k $5}' | tail -n 2"
fi


