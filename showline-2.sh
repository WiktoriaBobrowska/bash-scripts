#!/bin/bash

while getopts ":r" opt; do
    case $opt in
        r) r=1;;
    esac
done

shift $((OPTIND-1))
if [[ $1 -eq 0 ]];
then
        echo "Niepoprawny argument: numer linii musi byc rozny od 0."
fi

file=$1
shift

for i in $@
do
        if [[ $r -eq 1 ]];
        then
                echo "$(tac $file | awk -v x=$i 'NR==x')"
        else
                echo "$(cat $file | awk -v x=$i 'NR==x')"
        fi
done
