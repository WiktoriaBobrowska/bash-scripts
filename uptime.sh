#!/bin/bash

#czas dzialania serwera w sekundach
timeS=$(uptime -s)
#czas aktualny z argumentu 
timeC=$(date '+%Y-%m-%d %H:%M:%S')

u="s"
a=0

while getopts ":au:" opt; do
    case $opt in
        a) a=1;;
	u) u=$OPTARG;; 
    esac
done

shift $((OPTIND-1))

if [ $# -eq 1 ]
then 
	timeC="$1"
fi

declare -A x ##deklaracja tablicy x 
x["s"]=$(echo $(date '+%s' -d "$timeC") - $(date '+%s' -d "$timeS") | bc )
x["m"]=$(echo "scale=2; ${x["s"]} / 60 " | bc )
x["h"]=$(echo "scale=2; ${x["s"]} / (60*60) " | bc )
x["d"]=$(echo "scale=2; ${x["s"]} / (60*24*60) " | bc )

if [[ $a -eq 1 ]];
then
	printf "uptime=%11.2f s\n" ${x["s"]}
	printf "      %11.2f m\n" ${x["m"]}
	printf "      %11.2f h\n" ${x["h"]}
	printf "      %11.2f d\n" ${x["d"]}
else
	printf "uptime= %.2f %s\n" ${x[${u}]} ${u}
fi
