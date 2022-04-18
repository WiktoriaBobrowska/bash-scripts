#!/bin/bash

#file=$(ps -eo uid,pid,ppid,size,nlwp,pri,rtprio,policy,stat,comm | sed 1d)
p=0
while getopts "pu:" o
do
   case $o in
	p) p=1;;
	u) u="$OPTARG";;
   esac
done

shift $(($OPTIND-1))
file=$(cat $1 | sed 1d)

echo "PRI N"
if [[ $p -eq 0 && -z $u ]];
then
	echo $file | awk '{print $6}' | sort -n | uniq -c | awk '{print $2 "" $1}'
else
	if [[ $p -eq 1 ]]; 
	then
		#
	fi
	if [[ ! -z $u ]];
	then
		echo $file | awk '{if($1=="$u") print $6}' | sort -n | uniq -c | awk '{print $2 "" $1}'	
	fi
	if [[ $p -eq 1 && ! -z $u ]];
	then
		#
	fi  
fi
	
