#!/bin/bash
if [ $# -eq 0 ];
then 
	echo "No arguments given"
fi

for i in $* 
do 	
	if [[ -z $(file $i | grep "text") ]]; 
	then
		echo " $(basename $i) is not a text file ... skipping ..." 
		echo "======================================================================="
		echo 
	else
		echo " " 
   		echo "plik $(basename $i): HEAD"
    		echo "--------------------------------"
   		head -n 10 $i
    		echo " "
    		echo "plik $(basename $i): TAIL"
    		echo "--------------------------------"
    		tail -n 10 $i
    		echo "======================================================================="
    		echo " "
	fi
done
