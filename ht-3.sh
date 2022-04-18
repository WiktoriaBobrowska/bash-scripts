#!/bin/bash

t=10
b=10

while getopts ":t:b:" option; 
do
	case "${option}" in
        t)
            t=${OPTARG}
            ;;
        b)
            b=${OPTARG}
            ;;
        *)
            ;;
	esac
done

shift $((OPTIND-1))


for i in $*
do
	if  [[ ! -z $(file $i | grep "text") ]];
	then
		echo " "
		echo "plik $(basename $i): HEAD"
    		echo "--------------------------------"
		head -n $t $i
		echo " " 
		echo "plik $(basename $i): TAIL"
		echo "--------------------------------"
   	 	tail -n $b $i
    		echo "======================================================================="
   		echo " "
	else
		echo " $(basename $i) is not a text file ... skipping ..." 
		echo "======================================================================="
		echo " "	
	fi
done

