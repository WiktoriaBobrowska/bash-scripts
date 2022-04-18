#!/bin/bash

while getopts "d:f:" option; do
    case "$option" in
        d)
            delimiter=$OPTARG;;
        f)
            filename=$OPTARG;;
    esac
done
shift $((OPTIND-1))
fields=$*
if [[ ! -z  $delimiter ]];
then 
	#echo "$(cut -d$delimiter -f"$fields" $filename)"
	echo "$(cut -d: --output-delimiter "$delimiter" -f"$fields" $filename)"
else
	echo "$(cut "-d " -f"$fields" $filename)"
fi
