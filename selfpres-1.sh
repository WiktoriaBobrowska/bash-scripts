#!/bin/bash
arg=$@
echo $(basename $0 .sh)
echo $#
if [ $# -lt 3 ];
then
	echo "This script needs at least 3 command-line arguments!"
else
	echo "Arguments may be printed using iterative instruction"

	echo "for ..."
	for i in $*
	do 
		echo $i
	done
	
	set -- $arg
	echo "while [[ \$# -gt 0 ]] ..."
	while [[ $# -gt 0 ]]
	do
		echo $1
		shift
	done
	
	set -- $arg
	echo "while (( \$# > 0 )) ..."
	while (( $# > 0 ))
	do
		echo $1 
		shift	
	done
	
	set -- $arg
	echo "until ..."
	i=0
	until [ $# -le $i ]
	do
		echo $1
		shift
	done
fi
