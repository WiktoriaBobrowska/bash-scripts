#!bin/bash/

t=0
u=0
n=0
l=0

while getopts "tuU:nl" opt; 
do
	case $opt in 
		t) t=1;;
		u) u=1;;
		U) U=$OPTARG;;
		n) n=1;;
		l) l=1;;
	esac
done 

shift $((OPTIND-1))

file=$1

if [[ t = 1 ]];
then
	tgid=$(echo "$file" | awk '{printf $4}' | wc -l -1)
	printf $tgid
fi

if [[ u -eq 1 ]];
then
	uid=$(echo "$file" | awk '{printf $1}' | uniq | wc -l -1)
	printf $uid
fi

if [[ n -eq 1 ]];
then
	nice=$(echo "$file" | awk '{printf $6}' |  wc -l -1)
	printf $nice

fi

if [[ l -eq 1 ]];
then
	nlwp=$(echo "$file" | awk '{printf $8}' |  wc -l -1)
	printf $nlwp
fi


