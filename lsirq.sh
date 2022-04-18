#!/bin/bash/
s=0
file=/proc/interrupts

while getopts "f:s" opt
do
   case $opt in
   f) file=$OPTARG;;
   s) s=1;;
   esac
done
shift $((OPTIND-1))

proc=$(nproc)
base="$(awk '/[0-9]+:/ {gsub(/:/, "", $1); for(i=2; i<'$proc'+1; i++) x+=$i; print x "\t" $1 "\t" $NF;}' $file)"

if [[ $s -eq 0 ]]; 
then
	echo "$base"
elif [[ $s -eq 1 ]];
then
	echo "$(base | sort -r -n)"
fi

grep LOC $file | awk '{for(i=2; i<='$proc'+1; i++) x+=$i; print x " Local timer interrupts"}'
