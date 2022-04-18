#!/bin/bash 

file=0
user=0

while getopts "f:u:" option
do
   case $option in
   f) filename=$OPTARG
      ;;
   u) user=$OPTARG
      ;;
   esac
done
shift $((OPTIND-1))

if [[ $file == 0 ]] && [[ $user == 0 ]]; then
	I=$(ps -e -o user,s,pid,tgid,lwp,nlwp,rss,args | awk '/ I / {print}' | wc -l)
	R=$(ps -e -o user,s,pid,tgid,lwp,nlwp,rss,args | awk '/ R / {print}' | wc -l)
	S=$(ps -e -o user,s,pid,tgid,lwp,nlwp,rss,args | awk '/ S / {print}' | wc -l)
	Z=$(ps -e -o user,s,pid,tgid,lwp,nlwp,rss,args | awk '/ Z / {print}' | wc -l)
	T=$(ps -e -o user,s,pid,tgid,lwp,nlwp,rss,args | awk '/ T / {print}' | wc -l)
	echo "I=$I"
	echo "R=$R"
	echo "S=$S"
	echo "T=$T"
	echo "Z=$Z"

elif [[ $user != 0 ]] &&  [[ $file == 0 ]]; then
	I=$(awk -v user=$user '/I/ $1==$USER {print}' $file| wc -l)
	R=$(awk  -v user=$user '/ R / $1==$USER {print}' $file| wc -l)
	S=$(awk  -v user=$user '/ S / $1==$USER {print}' $file| wc -l)
	Z=$(awk  -v user=$user '/ Z /  $1==$USER {print}' $file| wc -l)
	T=$(awk -v user=$user '/ T / $1==$USER {print}' $file| wc -l)
 	echo "I=$I"
        echo "R=$R"
        echo "S=$S"
        echo "T=$T"
        echo "Z=$Z"

elif [[ $file != 0 ]] && [[ $user == 0 ]]; then 

	I=$(awk '/ I / {print}' $file| wc -l)
	R=$(awk '/ R / {print}' $file| wc -l)
	S=$(awk '/ S / {print}' $file| wc -l)
	Z=$(awk '/ Z / {print}' $file| wc -l)
	T=$(awk '/ T / {print}' $file| wc -l)
	echo "I=$I"
	echo "R=$R"
	echo "S=$S"
	echo "T=$T"
	echo "Z=$Z"


fi

