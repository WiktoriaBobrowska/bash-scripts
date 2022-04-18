#! /bin/bash
if [[ $# -eq 0 ]];
then
	echo "Nie podano argument√w"
else 

	cat $1 | while read user password
	do
		echo $user $password $(echo -n $password | md5sum | cut -f 1 -d ' ')
	done
fi
