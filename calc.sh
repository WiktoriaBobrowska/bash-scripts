#!bin/bash/

f=0
while getopts "f:p:" opt; 
do
	case $opt in 
		f) f=1;;
		p) p=$OPTARG;;
	esac
done 

shift $((OPTIND-1))

liczba1=$1
operator=$2
liczba2=$3

if [[ $f -eq 0 ]];
then
	echo $(($liczba1 $operator $liczba2))
else
	if [[ -z $p ]];
	then
		echo "scale=1; $liczba1 $operator $liczba2" | bc
	fi

	echo "scale=$p; $liczba1 $operator $liczba2" | bc
fi
