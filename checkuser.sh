#/bin/bash/

if [ $1 ];
then 
	if [ "$(whoami)" == "$1" ];
	then 
	echo "$1 jest wlascicielem powloki"
	else 
	echo "$1 NIE jest wlascicielem powloki"
	fi
else 
echo "Uzycie: ./$(basename $0) user"
fi
