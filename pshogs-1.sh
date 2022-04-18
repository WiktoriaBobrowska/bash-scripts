#!/bin/bash 

number=3
while getopts "f:n:" opt
do
   case $opt in
      f)file=$OPTARG;;
      n)number=$OPTARG;;
   esac
done

shift $(($OPTIND-1))

if [[ -z $file ]];
then
	echo "CPU hogs:"
	 ps -eo user,vsz,rsz,pcpu,comm | sed 1d |sort -k 4 -n -r | head -n $number
	echo "RES hogs:"
	ps -eo user,vsz,rsz,pcpu,comm | sed 1d |sort -k 3 -n -r | head -n $number
	echo "VIRT hogs:"
	ps -eo user,vsz,rsz,pcpu,comm | sed 1d |sort -k 2 -n -r | head -n $number
else 
	echo "CPU hogs:"
       	cat $file | sed 1d |sort -k 4 -n -r | head -n $number
        echo "RES hogs:"
        cat $file | sed 1d |sort -k 3 -n -r | head -n $number
        echo "VIRT hogs:"
        cat $file | sed 1d |sort -k 2 -n -r | head -n $number
fi


