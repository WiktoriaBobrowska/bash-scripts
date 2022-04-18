#!/bin/bash 


file=$(cat $1)
file=$(echo "$file" | grep "$2")

while read a b c; do

	if [[ $b -eq 0 ]];
	then
		continue 
	fi
	
	if [ ! -z "$3" ];
	then
	(( h=$3*1024 ))
		if [[ $b -gt $h ]];
		then	
			echo "Memory OK! " 
		else
			echo "Memory too low! "
		fi
	fi

	t=$(echo "scale=2; $b / 1024 " | bc)
	printf "$a\t$t MB \n"
done <<< ${file}
